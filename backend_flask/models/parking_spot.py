# Description: This file contains the ParkingSpot model.
from sqlalchemy.orm import relationship
from sqlalchemy import (
    Column,
    Integer,
    Numeric,
    String,
    Boolean,
    ForeignKey,
)
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Enum
from flask import jsonify
from .user import User
from .address import Address

Base = declarative_base()


class ParkingSpot(Base):
    __tablename__ = "parking_spots"

    spot_id = Column(Integer, primary_key=True)
    name = Column(String(127), nullable=False)
    description = Column(String(511))
    height = Column(Numeric(precision=10, scale=2))
    width = Column(Numeric(precision=10, scale=2))
    length = Column(Numeric(precision=10, scale=2))
    internal = Column(Boolean, nullable=False)
    easy_access = Column(Boolean, nullable=False)
    security = Column(Boolean, nullable=False)
    charging = Column(Boolean, nullable=False)
    owner_id = Column(Integer, ForeignKey(User.id, ondelete="CASCADE"), nullable=False)
    address_id = Column(Integer, ForeignKey(Address.address_id, ondelete="SET NULL"))
    # address_model ???
    price = Column(Numeric(precision=10, scale=2))
    currency = Column(String(3), default="USD")
    images_url = Column(String(511), nullable=False)
    # Relations
    owner = relationship(User)
    address = relationship(Address)

    def to_dict(self):
        return {
            "spot_id": self.spot_id,
            "name": self.name,
            "description": self.description,
            "height": self.height,
            "width": self.width,
            "length": self.length,
            "internal": self.internal,
            "easy_access": self.easy_access,
            "security": self.security,
            "charging": self.charging,
            "owner_id": self.owner_id,
            "address_id": self.address_id,
            "price": self.price,
            "currency": self.currency,
            "imagesURL": self.images_url,
        }

    def to_json(self):
        return jsonify(self.to_dict())
