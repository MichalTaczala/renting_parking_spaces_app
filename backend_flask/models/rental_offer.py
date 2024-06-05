from flask import jsonify
import sqlalchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import (
    Column,
    Integer,
    Boolean,
    ForeignKey,
    Numeric,
    CheckConstraint,
    TIMESTAMP,
    Date,
)
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.postgresql import ENUM
from .parking_spot import ParkingSpot


# Define the rental_status enumeration type
rental_status_enum = ENUM("active", "inactive", name="rental_status")

Base = declarative_base()


class RentalOffer(Base):
    __tablename__ = "rental_offers"

    offer_id = Column(Integer, primary_key=True)
    auto_accept = Column(Boolean, nullable=False)
    price = Column(
        Numeric(precision=4, scale=2), CheckConstraint("price > 0"), nullable=False
    )
    created_at = Column(
        TIMESTAMP, server_default=sqlalchemy.func.current_timestamp(), nullable=False
    )
    start_date = Column(Date, nullable=False)
    end_date = Column(Date, nullable=False)
    status = Column(rental_status_enum, nullable=False, default="active")
    spot_id = Column(
        Integer, ForeignKey(ParkingSpot.spot_id, ondelete="CASCADE"), nullable=False
    )

    # Define a relationship to access ParkingSpot from RentalOffer
    spot = relationship(ParkingSpot)

    def to_dict(self):
        return {
            "offer_id": self.offer_id,
            "auto_accept": self.auto_accept,
            "price": self.price,
            "created_at": self.created_at,
            "start_date": self.start_date,
            "end_date": self.end_date,
            "status": self.status,
            "spot_id": self.spot_id,
        }

    def to_json(self):
        return jsonify(self.to_dict())
