class CategoryModel {
  String? categoryName;
  String? categoryImage;
  String? categoryDesc;
  String? dateTime;

  CategoryModel(
      {this.categoryName,
      this.categoryImage,
      this.categoryDesc,
      this.dateTime});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'];
    categoryDesc = json['categoryDesc'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toMap() {
    return {
      'categoryName': categoryName,
      'categoryImage': categoryImage,
      'categoryDesc': categoryDesc,
      'dateTime': dateTime,
    };
  }
}
