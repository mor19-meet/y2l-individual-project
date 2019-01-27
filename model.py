from sqlalchemy import Column, Integer, String, Boolean
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship, sessionmaker
from sqlalchemy import create_engine

Base = declarative_base()

class Names(Base):
	__tablename__ = "names"
	id = Column(Integer, primary_key = True)
	name = Column(String)



# Write your classes here :
# class username(Base):
#     __tablename__ = 'name'
#     id = Column(Integer)
#     name = Column(String)