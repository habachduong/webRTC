from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_cors import CORS
from dotenv import load_dotenv
import os

# Load environment variables
load_dotenv()

# Initialize Flask app
app = Flask(__name__)

# Configure session
app.secret_key = os.getenv('FLASK_SECRET_KEY', 'your-secret-key-here')
app.config['SESSION_COOKIE_SECURE'] = True
app.config['SESSION_COOKIE_HTTPONLY'] = True
app.config['SESSION_COOKIE_SAMESITE'] = 'Lax'

# Configure CORS
CORS(app, supports_credentials=True, origins=[
    os.getenv('REACT_APP_URL', 'http://localhost:3000'),
    os.getenv('WSO2_URL', 'https://localhost:9443')
])

# Database configuration
app.config['SQLALCHEMY_DATABASE_URI'] = (
    f"mysql://{os.getenv('MYSQL_USER')}:{os.getenv('MYSQL_PASSWORD')}@"
    f"{os.getenv('MYSQL_HOST')}:{os.getenv('MYSQL_PORT')}/{os.getenv('MYSQL_DATABASE')}"
)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize extensions
db = SQLAlchemy(app)
migrate = Migrate(app, db)

# Import models
from models import *

# Import routes
from routes import *

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True) 