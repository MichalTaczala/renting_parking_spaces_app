# Description: This file contains the ParkingSpot model.

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Enum
from .user import User
from .address import Address
from sqlalchemy.orm import relationship
from sqlalchemy import (
    Column,
    Integer,
    Numeric,
    String,
    Boolean,
    ForeignKey,
)

Base = declarative_base()


class ParkingSpot(Base):
    __tablename__ = "parking_spots"

    spot_id = Column(Integer, primary_key=True)
    name = Column(String(127), nullable=False)
    description = Column(String(511))
    height = Column(Numeric(precision=10, scale=2))
    width = Column(Numeric(precision=10, scale=2))
    length = Column(Numeric(precision=10, scale=2))
    parking_no = Column(String(8), nullable=False)
    availability = Column(Boolean, nullable=False)
    internal = Column(Boolean, nullable=False)
    wide_spot = Column(Boolean, nullable=False)
    easy_access = Column(Boolean, nullable=False)
    level = Column(Integer, nullable=False)
    security = Column(Boolean, nullable=False)
    charging = Column(Boolean, nullable=False)
    owner_id = Column(
        Integer, ForeignKey("users.id", ondelete="CASCADE"), nullable=False
    )
    address_id = Column(Integer, ForeignKey("address.address_id", ondelete="SET NULL"))

    price = Column(Numeric(precision=10, scale=2))
    currency = Column(String(3), default="USD")

    owner = relationship("User")
    address = relationship("Address")
