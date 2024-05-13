# Description: This file contains the Booking model.

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import (
    Column,
    BigInteger,
    TIMESTAMP,
    Numeric,
    Integer,
    ForeignKey,
    CheckConstraint,
)
from sqlalchemy.orm import relationship
from sqlalchemy.dialects.postgresql import ENUM

# Define the booking_status enumeration type
booking_status_enum = ENUM("pending", "confirmed", "cancelled", name="booking_status")

Base = declarative_base()


class Booking(Base):
    __tablename__ = "bookings"

    booking_id = Column(BigInteger, primary_key=True)
    booking_start = Column(TIMESTAMP, nullable=False)
    booking_end = Column(TIMESTAMP, nullable=False)
    status = Column(booking_status_enum, nullable=False)
    price_total = Column(
        Numeric(precision=8, scale=2),
        CheckConstraint("price_total >= 0"),
        nullable=False,
    )
    user_id = Column(Integer, ForeignKey("users.user_id"), nullable=False)
    offer_id = Column(Integer, ForeignKey("rental_offers.offer_id"), nullable=False)

    user = relationship("User")
    offer = relationship("RentalOffer")
