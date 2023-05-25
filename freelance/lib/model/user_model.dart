class UserModel {
  String name;
  String email;

  UserModel({this.name = "", this.email = ""});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(name: json['name'], email: json['email']);
  }
}
