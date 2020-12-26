from flask import jsonify
from passlib.hash import sha512_crypt


def hash_password(password):
    return sha512_crypt.hash(password)


def register_user_controll(User, **kwargs):
    try:
        login = kwargs.get('login')
        password = kwargs.get('password')
        phone = kwargs.get('phone')
        user_fio = kwargs.get('name').split(' ')
        if len(user_fio) == 2:
            return User(last_name=user_fio[0],
                        first_name=user_fio[1],
                        phone=phone,
                        login=login,
                        password_src=password,
                        password_hash=hash_password(password))
        elif len(user_fio) == 3:
            return User(last_name=user_fio[0],
                        first_name=user_fio[1],
                        middle_name=user_fio[2],
                        phone=phone,
                        login=login,
                        password_src=password,
                        password_hash=hash_password(password))
        else:
            raise Exception("Неправильное ФИО пользователя")
    except Exception as e:
        raise e


def check_exist_user_controller(session, User, **kwargs):
    try:
        login = kwargs.get('login')
        password = kwargs.get('password')
        finded_user = session.query(User).filter(User.login ==login, 
                                          User.password_hash == hash_password(password)).first()
        if finded_user:
            return finded_user
        else:
            raise Exception("Нет пользователя с указанными данными")
    except Exception as e:
        raise e