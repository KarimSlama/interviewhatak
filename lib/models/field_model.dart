class FieldModel {
  String? fieldName;
  String? fieldDescription;
  String? fieldDate;
  String? categoryName;

  FieldModel(
      {this.fieldName,
      this.fieldDescription,
      this.fieldDate,
      this.categoryName});

  FieldModel.fromJson(Map<String, dynamic> json) {
    fieldName = json['fieldName'];
    fieldDescription = json['fieldDescription'];
    fieldDate = json['fieldDate'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toMap() {
    return {
      'fieldName': fieldName,
      'fieldDescription': fieldDescription,
      'fieldDate': fieldDate,
      'categoryName': categoryName,
    };
  }
}
