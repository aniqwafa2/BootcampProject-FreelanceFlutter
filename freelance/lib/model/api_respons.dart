class ApiRespons<T> {
  int code;
  String message;
  T? data;

  ApiRespons({this.code = 0, this.message = "", this.data});

  factory ApiRespons.fromJson(
      Map<String, dynamic> json, Function fromJsonModel) {
    return ApiRespons(
      code: (json['code'] != null) ? json['code'] : 0,
      message: (json['message'] != null) ? json['message'] : "",
      data: (json['data'] != null) ? fromJsonModel(json['data']) : null,
    );
  }
}
