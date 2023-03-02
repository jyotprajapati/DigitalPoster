class CategoryFramesModel {
  int? id;
  String? title;
  int? categoryId;
  int? languageId;
  List<String>? image;

  CategoryFramesModel(
      {this.id, this.title, this.categoryId, this.languageId, this.image});

  CategoryFramesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    categoryId = json['category_id'];
    languageId = json['language_id'];
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['category_id'] = this.categoryId;
    data['language_id'] = this.languageId;
    data['image'] = this.image;
    return data;
  }
}
