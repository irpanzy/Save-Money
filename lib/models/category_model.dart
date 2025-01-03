class CategoryModel {
  final int? id;
  final String title;
  final String type;

  CategoryModel({this.id, required this.title, required this.type});

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['categories_id'],
      title: map['title'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'categories_id': id,
      'title': title,
      'type': type,
    };
  }
}
