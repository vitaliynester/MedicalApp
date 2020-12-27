class UserModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String phone;
  String login;
  String password;
  String passwordHash;

  UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phone,
    this.login,
    this.password,
    this.passwordHash,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    login = json['login'];
    password = json['password_src'];
    passwordHash = json['password_hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> user = new Map<String, dynamic>();
    user['user_id'] = this.id;
    user['user_email'] = this.email;
    user['user_first_name'] = this.firstName;
    user['user_last_name'] = this.lastName;
    user['user_phone'] = this.phone;
    user['user_login'] = this.login;
    user['user_password_src'] = this.password;
    user['user_password_hash'] = this.passwordHash;
    return user;
  }
}
