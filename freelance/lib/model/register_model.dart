class RegisterModel<T> {
  int code;
  String message;
  T? data;

  RegisterModel({this.code = 0, this.message = "", this.data});

  factory RegisterModel.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    return RegisterModel(
      code: 1,
      message: json['message'],
      data: (json['data'] != null) ? fromJsonModel(json['data']) : null,
    );
  }
  factory RegisterModel.errorRespons(int code) {
    return RegisterModel(
      message: "Register was denied",
      data: null,
    );
  }
}
