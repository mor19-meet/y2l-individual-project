from model import *

from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

engine = create_engine('sqlite:///database.db')
Base.metadata.create_all(engine)
DBSession = sessionmaker(bind=engine)
session = DBSession()

def save_to_database(name):
	new_name = Names(
		name = name)
	session.add(new_name)
	session.commit()

def get_all_names():
	names = session.query(Names).all()
	return names

# def save_name(name):
#     name_object = userName(
#     	name = name)
#     session.add(name_object)
#     session.commit()
# save_name("mor")

# def delete_name(their_name):
#    session.query(name).filter_by(
#        name=their_name).delete()
#    session.commit()

# delete_name()