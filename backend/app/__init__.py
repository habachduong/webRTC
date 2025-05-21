from flask import Flask
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_jwt_extended import JWTManager
import os

# Khởi tạo các extension
db = SQLAlchemy()
migrate = Migrate()
jwt = JWTManager()

def create_app():
    app = Flask(__name__)
    
    # Cấu hình app
    app.config['SECRET_KEY'] = os.getenv('SECRET_KEY', 'dev')
    app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL', 'mysql://root:root@mysql:3306/telesystem')
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
    app.config['JWT_SECRET_KEY'] = os.getenv('JWT_SECRET_KEY', 'jwt-secret-key')
    
    # Cấu hình CORS
    CORS(app, supports_credentials=True, resources={
        r"/api/*": {
            "origins": ["http://localhost:3000"],
            "methods": ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
            "allow_headers": ["Content-Type", "Authorization"]
        }
    })

    # Khởi tạo các extension với app
    db.init_app(app)
    migrate.init_app(app, db)
    jwt.init_app(app)

    # Đăng ký các blueprint
    from app.routes.auth import auth_bp
    from app.routes.cdr import cdr_bp
    from app.routes.user import user_bp
    from app.routes.system import system_bp

    app.register_blueprint(auth_bp, url_prefix='/api/auth')
    app.register_blueprint(cdr_bp, url_prefix='/api/cdr')
    app.register_blueprint(user_bp, url_prefix='/api/users')
    app.register_blueprint(system_bp, url_prefix='/api/system')

    return app 