

class QuestionContent {
  String? type;
  String? fieldType;
  List<QuestionContent>? subFields;
  String? title;
  bool? isSpace;
  bool? isAnswer;

  QuestionContent({
    this.type,
    this.fieldType,
    this.subFields,
    this.title,
    this.isSpace,
    this.isAnswer,
  });

  factory QuestionContent.fromJson(Map<String, dynamic> json) {
    List<QuestionContent> subFields = [];
    if (json['sub_fields'] != null) {
      json['sub_fields'].forEach((subField) {
        subFields.add(QuestionContent.fromJson(subField));
      });
    }
    return QuestionContent(
      type: json['type'],
      fieldType: json['field_type'],
      subFields: subFields,
      title: json['title'],
      isSpace: json['is_space'],
      isAnswer: json['is_answer'],
    );
  }
}

class ArithmeticTextModel {
  int? type;
  List<List<QuestionContent>>? questionContent;

  ArithmeticTextModel({this.type, this.questionContent});

  factory ArithmeticTextModel.fromJson(Map<String, dynamic> json) {
    List<List<QuestionContent>> questionContent = [];
    if (json['question_content'] != null) {
      json['question_content'].forEach((questionItem) {
        List<QuestionContent> items = [];
        questionItem.forEach((item) {
          items.add(QuestionContent.fromJson(item));
        });
        questionContent.add(items);
      });
    }
    return ArithmeticTextModel(
      type: json['type'],
      questionContent: questionContent,
    );
  }
}
