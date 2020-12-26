from main import db, session, Base
from sqlalchemy.inspection import inspect


class User(Base):
    __tablename__ = 'm_user'
    id = db.Column('user_id',
                   db.Integer,
                   primary_key=True)
    first_name = db.Column('user_first_name',
                           db.String(200),
                           nullable=False)
    last_name = db.Column('user_last_name',
                          db.String(200),
                          nullable=False)
    middle_name = db.Column('user_middle_name',
                            db.String(200))
    phone = db.Column('user_phone', 
                      db.String(20),
                      nullable=False)
    login = db.Column('user_login',
                      db.String(64),
                      nullable=False,
                      unique=True)
    password_hash = db.Column('user_password_hash',
                              db.String(256),
                              nullable=False)
    password_src = db.Column('user_password_src',
                             db.String(64),
                             nullable=False)

    def serialize(self):
        d = Serializer.serialize(self)
        return d


class Serializer(object):
    def serialize(self):
        return {c: getattr(self, c) for c in inspect(self).attrs.keys()}

    @staticmethod
    def serialize_list(l):
        return [m.serialize() for m in l]
