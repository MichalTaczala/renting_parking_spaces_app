import requests
from flask import Flask, request, jsonify
from flask import Blueprint
from models import User
from sqlalchemy.orm import Session
from sqlalchemy.exc import SQLAlchemyError
from db_conn import get_session


user_bp = Blueprint("parking_spot", __name__)
