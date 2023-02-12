class QuestionModel {
  String? question;
  String? answer;
  String? firstImage;
  String? secondImage;
  String? subAnswer;
  String? fieldName;
  String? categoryName;
  bool? isFavorite;
  String? sectionName;

  QuestionModel({
    this.question,
    this.answer,
    this.fieldName,
    this.firstImage,
    this.secondImage,
    this.subAnswer,
    this.categoryName,
    this.sectionName,
    this.isFavorite,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    fieldName = json['fieldName'];
    firstImage = json['firstImage'];
    secondImage = json['secondImage'];
    subAnswer = json['subAnswer'];
    categoryName = json['categoryName'];
    sectionName = json['sectionName'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
      'fieldName': fieldName,
      'firstImage': firstImage,
      'secondImage': secondImage,
      'subAnswer': subAnswer,
      'categoryName': categoryName,
      'sectionName': sectionName,
      'isFavorite': isFavorite,
    };
  }
}
