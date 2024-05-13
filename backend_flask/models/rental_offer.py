import sqlalchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import (
    Column,
    Integer,
    String,
    Boolean,
    ForeignKey,
    Numeric,
    CheckConstraint,
    TIMESTAMP,
    Date,
)
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.postgresql import ENUM


# Define the rental_status enumeration type
rental_status_enum = ENUM("active", "inactive", name="rental_status")


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
        Integer, ForeignKey("parking_spots.spot_id", ondelete="CASCADE"), nullable=False
    )

    # Define a relationship to access ParkingSpot from RentalOffer
    spot = relationship("ParkingSpot")
