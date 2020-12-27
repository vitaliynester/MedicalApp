import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRepository {
  Future<UserModel> loginUser(String login, String password);
  Future<UserModel> registerUser(Map<String, dynamic> data);
}

class UserRepositoryImpl implements UserRepository {
  @override
  Future<UserModel> loginUser(String login, String password) async {
    var params = {
      'login': login,
      'password': password,
    };
    var uri = Uri.http(mainUri, '/login_user').replace(queryParameters: params);
    var response = await http.get(
      uri,
      headers: {"Content-Type": "application/json", "Connection": "keep-alive"},
    );
    if (response.statusCode == 200) {
      try {
        var data = json.decode(utf8.decode(response.bodyBytes));
        if (data['msg'] == null) {
          UserModel user = UserModel.fromJson(data);
          return user;
        } else {
          var msg = json.decode(response.body);
          throw Exception(msg['msg']);
        }
      } catch (e) {
        throw e;
      }
    } else {
      throw Exception('Error! Status code: ${response.statusCode}');
    }
  }

  @override
  Future<UserModel> registerUser(Map<String, dynamic> data) async {
    try {
      var dioResponse = Dio();
      var response = await dioResponse.post(
        "http://" + mainUri + '/register_user',
        data: {
          'first_name': data['first_name'],
          'last_name': data['last_name'],
          'login': data['login'],
          'password': data['password'],
          'phone': data['phone'],
          'email': data['email'],
        },
      );
      if (response.data['msg'] != null) {
        throw Exception(response.data['msg']);
      }
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}
