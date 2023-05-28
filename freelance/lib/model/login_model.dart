import 'dart:ffi';

class LoginModel {
  String message;
  String type;
  String access_token;
  int code;

  LoginModel(
      {this.type = " ",
      this.access_token = " ",
      this.message = "",
      this.code = 0});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      message: "Sucsess Loged in",
      type: json['type'],
      access_token: json['access_token'],
      code: 1,
    );
  }

  factory LoginModel.errorRespon(Map<String, dynamic> json) {
    return LoginModel(
      message: json['message'],
      type: "",
      access_token: "",
      code: 0,
    );
  }
}
