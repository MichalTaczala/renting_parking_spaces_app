# Description: This file contains the ParkingSpot model.

import sqlalchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Enum
from sqlalchemy.orm import relationship
from sqlalchemy import Column, Integer, String, Boolean, ForeignKey, CheckConstraint

Base = declarative_base()


class ParkingSpot(Base):
    __tablename__ = "parking_spots"

    spot_id = Column(Integer, primary_key=True)
    description = Column(String(511))
    size = Column(Integer, CheckConstraint("size > 0"))
    parking_no = Column(String(8), nullable=False)
    availability = Column(Boolean, nullable=False)
    internal = Column(Boolean, nullable=False)
    wide_spot = Column(Boolean, nullable=False)
    easy_access = Column(Boolean, nullable=False)
    level = Column(Integer, nullable=False)
    security = Column(Boolean, nullable=False)
    charging = Column(Boolean, nullable=False)
    owner_id = Column(Integer, ForeignKey("users.user_id", ondelete="CASCADE"))
    address_id = Column(Integer, ForeignKey("address.address_id", ondelete="SET NULL"))

    owner = relationship("User")
    address = relationship("Adress")
