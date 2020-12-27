import sqlalchemy as db
from flask import Flask, jsonify, request
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, scoped_session
from sqlalchemy.ext.declarative import declarative_base
from config import Config
from controller import *

app = Flask(__name__)

engine = create_engine(Config.SQLALCHEMY_DATABASE_URI)
session = scoped_session(sessionmaker(autocommit=False,
                                      autoflush=False,
                                      bind=engine))

Base = declarative_base()
Base.query = session.query_property()

from models import *

Base.metadata.create_all(bind=engine)


@app.route('/register_user', methods=['POST'])
def register_user():
    try:
        params = request.json
        new_user = register_user_controll(User, **params)
        session.add(new_user)
        session.commit()
        return jsonify(new_user.serialize())
    except Exception as e:
        return jsonify({'msg': str(e)})


@app.route('/login_user', methods=['GET'])
def check_exist_user():
    try:
        params = request.args
        exist_user = check_exist_user_controller(session, User, **params)
        return jsonify(exist_user.serialize())
    except Exception as e:
        return jsonify({'msg': str(e)})


if __name__ == '__main__':
    app.run(debug=Config.DEBUG,
            host=Config.HOST_URL,
            port=Config.HOST_PORT)
