"""Model for a booking record"""

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
from .user import User
from .rental_offer import RentalOffer

# Define the booking_status enumeration type
booking_status_enum = ENUM("pending", "confirmed", "cancelled", name="booking_status")

Base = declarative_base()


class Booking(Base):
    """Booking model for representing a single space reservation."""

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
    user_id = Column(Integer, ForeignKey(User.id), nullable=False)
    offer_id = Column(Integer, ForeignKey(RentalOffer.offer_id), nullable=False)

    user = relationship(User)
    offer = relationship(RentalOffer)

    def json(self):
        """Return the booking information as a JSON object."""
        return {
            "booking_id": self.booking_id,
            "booking_start": self.booking_start,
            "booking_end": self.booking_end,
            "status": self.status,
            "price_total": self.price_total,
            "user_id": self.user_id,
            "offer_id": self.offer_id,
        }
