# Description: This file contains the Address model.

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String, Numeric

Base = declarative_base()


class Address(Base):
    __tablename__ = "address"

    address_id = Column(Integer, primary_key=True)
    long = Column(Numeric(precision=9, scale=6), nullable=False)
    lat = Column(Numeric(precision=8, scale=6), nullable=False)
    street = Column(String(255), nullable=False)
    house_no = Column(String(8), nullable=False)
    postal_code = Column(String(20), nullable=False)
    city = Column(String(127), nullable=False)
    region = Column(String(127), nullable=False)
    district = Column(String(127))
    country = Column(String(100), nullable=False)
