class CategoryModel {
  int id;
  String name;
  String description;

  CategoryModel({this.id = 0, this.name = "", this.description = ""});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id: json['id'], name: json['name'], description: json['description']);
  }
}
