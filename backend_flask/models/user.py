from flask import jsonify
import sqlalchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Enum


Base = declarative_base()


class User(Base):
    """
    User model class.
    """

    __tablename__ = "users"
    id = sqlalchemy.Column(sqlalchemy.Integer, primary_key=True)
    firebase_token = sqlalchemy.Column(sqlalchemy.Text, nullable=False)
    username = sqlalchemy.Column(sqlalchemy.String(31), nullable=False)
    first_name = sqlalchemy.Column(sqlalchemy.String(50), nullable=False)
    last_name = sqlalchemy.Column(sqlalchemy.String(100), nullable=False)
    email = sqlalchemy.Column(sqlalchemy.String(100), nullable=False, unique=True)
    type = sqlalchemy.Column(
        Enum("regular", "admin", "guest", name="user_types"), default="regular"
    )
    phone_prefix = sqlalchemy.Column(sqlalchemy.String(3))
    phone = sqlalchemy.Column(sqlalchemy.String(15), nullable=False, unique=True)

    # other
    required_fields = [
        "firebase_token",
        "username",
        "first_name",
        "last_name",
        "email",
        "phone",
    ]

    @property
    def dict(self):
        """Return a JSON representation of the User object without password."""
        return {
            "id": self.id,
            "username": self.username,
            "first_name": self.first_name,
            "last_name": self.last_name,
            "email": self.email,
            "type": self.type,
            "phone_prefix": self.phone_prefix,
            "phone": self.phone,
        }

    @property
    def json(self):
        """Return a JSON representation of the User object without password."""
        return jsonify(self.dict)
