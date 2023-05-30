class UserModel {
  int id;
  String name;
  String email;

  UserModel({this.id = 0, this.name = "", this.email = ""});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: (json['id'] != null) ? json['id'] : 0,
        name: (json['name'] != null) ? json['name'] : "",
        email: (json['email'] != null) ? json['email'] : "");
  }
}
