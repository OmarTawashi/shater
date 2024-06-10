class QuestionAnswer {
  int? questionId;
  String? answer;
  int? isCorrect;

  QuestionAnswer({
    this.questionId,
    this.answer,
    this.isCorrect,
  });

  factory QuestionAnswer.fromJson(Map<String, dynamic> json) {
    return QuestionAnswer(
      questionId: json['question_id'],
      answer: json['answer'],
      isCorrect: json['is_correct'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question_id': questionId,
      'answer': answer,
      'is_correct': isCorrect,
    };
  }
}
