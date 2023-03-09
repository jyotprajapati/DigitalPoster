class CustomCategoryFrameModel {
  int? id;
  String? title;
  int? customCatId;
  int? languageId;
  List<String>? image;

  CustomCategoryFrameModel(
      {this.id, this.title, this.customCatId, this.languageId, this.image});

  CustomCategoryFrameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    customCatId = json['custom_cat_id'];
    languageId = json['language_id'];
    image = json['image'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['custom_cat_id'] = this.customCatId;
    data['language_id'] = this.languageId;
    data['image'] = this.image;
    return data;
  }
}
