# Description: This file contains the User model.

import sqlalchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Enum


Base = declarative_base()


class User(Base):
    __tablename__ = "users"

    user_id = sqlalchemy.Column(sqlalchemy.Integer, primary_key=True)
    username = sqlalchemy.Column(sqlalchemy.String(31), nullable=False)
    user_name = sqlalchemy.Column(sqlalchemy.String(50), nullable=False)
    user_surname = sqlalchemy.Column(sqlalchemy.String(100), nullable=False)
    email = sqlalchemy.Column(sqlalchemy.String(100), nullable=False, unique=True)
    user_type = sqlalchemy.Column(
        Enum("regular", "admin", "guest", name="user_types"), default="regular"
    )
    phone_prefix = sqlalchemy.Column(sqlalchemy.String(3))
    phone = sqlalchemy.Column(sqlalchemy.String(15), nullable=False, unique=True)
    password = sqlalchemy.Column(sqlalchemy.String(50), nullable=False)
