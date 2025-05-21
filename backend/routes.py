from flask import jsonify, request, redirect, url_for, session
from app import app, db
from models import User
import bcrypt
import jwt
from datetime import datetime, timedelta
import os
import requests
from authlib.integrations.flask_client import OAuth
from functools import wraps

# Initialize OAuth
oauth = OAuth(app)
wso2 = oauth.register(
    'wso2',
    client_id=os.getenv('WSO2_CLIENT_ID'),
    client_secret=os.getenv('WSO2_CLIENT_SECRET'),
    server_metadata_url=f"{os.getenv('WSO2_URL')}/oauth2/oidcdiscovery/.well-known/openid-configuration",
    client_kwargs={'scope': 'openid profile email'}
)

# Auth decorator
def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user' not in session:
            return jsonify({'error': 'Unauthorized'}), 401
        return f(*args, **kwargs)
    return decorated_function

# Helper functions
def generate_token(user_id):
    payload = {
        'user_id': user_id,
        'exp': datetime.utcnow() + timedelta(days=1)
    }
    return jwt.encode(payload, os.getenv('JWT_SECRET_KEY'), algorithm='HS256')

# Routes
@app.route('/api/health', methods=['GET'])
def health_check():
    return jsonify({'status': 'healthy'})

@app.route('/api/users', methods=['POST'])
def create_user():
    data = request.get_json()
    
    # Validate input
    if not all(k in data for k in ('username', 'email', 'password')):
        return jsonify({'error': 'Missing required fields'}), 400
    
    # Check if user exists
    if User.query.filter_by(username=data['username']).first():
        return jsonify({'error': 'Username already exists'}), 400
    if User.query.filter_by(email=data['email']).first():
        return jsonify({'error': 'Email already exists'}), 400
    
    # Create new user
    password_hash = bcrypt.hashpw(data['password'].encode('utf-8'), bcrypt.gensalt())
    user = User(
        username=data['username'],
        email=data['email'],
        password_hash=password_hash.decode('utf-8')
    )
    
    db.session.add(user)
    db.session.commit()
    
    return jsonify({
        'message': 'User created successfully',
        'user': {
            'id': user.id,
            'username': user.username,
            'email': user.email
        }
    }), 201

@app.route('/api/login', methods=['POST'])
def login():
    data = request.get_json()
    
    if not all(k in data for k in ('username', 'password')):
        return jsonify({'error': 'Missing username or password'}), 400
    
    user = User.query.filter_by(username=data['username']).first()
    if not user or not bcrypt.checkpw(data['password'].encode('utf-8'), user.password_hash.encode('utf-8')):
        return jsonify({'error': 'Invalid username or password'}), 401
    
    token = generate_token(user.id)
    return jsonify({
        'token': token,
        'user': {
            'id': user.id,
            'username': user.username,
            'email': user.email
        }
    })

# WSO2IS Routes
@app.route('/api/auth/login')
def login():
    redirect_uri = os.getenv('WSO2_REDIRECT_URI')
    return wso2.authorize_redirect(redirect_uri)

@app.route('/api/auth/callback')
def callback():
    token = wso2.authorize_access_token()
    userinfo = wso2.parse_id_token(token)
    
    # Store user info in session
    session['user'] = {
        'id': userinfo.get('sub'),
        'username': userinfo.get('preferred_username'),
        'email': userinfo.get('email'),
        'name': userinfo.get('name')
    }
    
    # Create or update user in database
    user = User.query.filter_by(email=userinfo.get('email')).first()
    if not user:
        user = User(
            username=userinfo.get('preferred_username'),
            email=userinfo.get('email'),
            password_hash=''  # No password needed for SSO
        )
        db.session.add(user)
        db.session.commit()
    
    return redirect(os.getenv('REACT_APP_URL', 'http://localhost:3000'))

@app.route('/api/auth/logout')
def logout():
    session.clear()
    return redirect(f"{os.getenv('WSO2_URL')}/oidc/logout")

@app.route('/api/auth/user')
@login_required
def get_user():
    return jsonify(session['user'])

# Thêm các routes khác ở đây 