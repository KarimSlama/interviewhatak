class SectionModel {
  String? image;
  String? sectionName;
  String? sectionDateTime;
  String? fieldName;
  String? categoryName;

  SectionModel({
    this.image,
    this.sectionName,
    this.sectionDateTime,
    this.fieldName,
    this.categoryName,
  });

  SectionModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    sectionName = json['sectionName'];
    sectionDateTime = json['sectionDateTime'];
    fieldName = json['fieldName'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'sectionDateTime': sectionDateTime,
      'fieldName': fieldName,
      'sectionName': sectionName,
      'categoryName': categoryName,
    };
  }
}
