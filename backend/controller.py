from flask import jsonify
from passlib.hash import sha512_crypt


def hash_password(password):
    return sha512_crypt.hash(password)


def register_user_controll(User, **kwargs):
    try:
        login = kwargs.get('login')
        password = kwargs.get('password')
        phone = kwargs.get('phone')
        email = kwargs.get('email')
        user_first_name = kwargs.get('first_name')
        user_last_name = kwargs.get('last_name')
        if len(login) < 6 or len(password) < 6 or len(phone) < 11 or len(email) < 6 or len(user_first_name) < 3 or len(user_last_name) < 3:
            raise Exception('Некорректные данные')
        return User(last_name=user_last_name,
                    first_name=user_first_name,
                    email=email,
                    phone=phone,
                    login=login,
                    password_src=password,
                    password_hash=hash_password(password))
    except Exception as e:
        raise e


def check_exist_user_controller(session, User, **kwargs):
    try:
        login = kwargs.get('login')
        password = kwargs.get('password')
        finded_user = session.query(User).filter(User.login ==login, 
                                                User.password_src == password).first()
        if finded_user:
            return finded_user
        else:
            raise Exception("Нет пользователя с указанными данными")
    except Exception as e:
        raise e