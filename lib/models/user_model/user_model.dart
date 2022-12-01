import 'dart:convert';

class UserModel {
  String userName = '';
  String password = '';

  UserModel(this.userName, this.password);

  Map<String, dynamic> toJson() => {
        'userName': userName,
        'password': password,
      };

  UserModel.fromJsonString(String jsonString) {
    var jsonMap = jsonDecode(jsonString);
    userName = jsonMap['userName'];
    password = jsonMap['password'];
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : userName = json['userName'],
        password = json['password'];
}
