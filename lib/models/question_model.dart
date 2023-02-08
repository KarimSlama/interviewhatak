class QuestionModel {
  String? question;
  String? answer;
  String? questionDateTime;
  String? fieldName;
  String? categoryName;

  QuestionModel({
    this.question,
    this.answer,
    this.questionDateTime,
    this.fieldName,
    this.categoryName,
  });

  QuestionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    answer = json['answer'];
    questionDateTime = json['questionDateTime'];
    fieldName = json['fieldName'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'answer': answer,
      'questionDateTime': questionDateTime,
      'fieldName': fieldName,
      'categoryName': categoryName,
    };
  }
}
