import 'package:shater/core/network/decodable.dart';

class QuestionSubjectModel extends Decodable<QuestionSubjectModel> {
  int? id;
  String? title;
  String? image;
  int? subjectId;
  int? pageNo;
  bool? isExplain;
  String? explainUrl;
  int? countQuestions;
  List<Questions>? questions;

  QuestionSubjectModel(
      {this.id,
      this.title,
      this.image,
      this.subjectId,
      this.pageNo,
      this.isExplain,
      this.explainUrl,
      this.countQuestions,
      this.questions});

  QuestionSubjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    subjectId = json['subject_id'];
    pageNo = json['page_no'];
    isExplain = json['is_explain'];
    explainUrl = json['explain_url'];
    countQuestions = json['count_questions'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['subject_id'] = this.subjectId;
    data['page_no'] = this.pageNo;
    data['is_explain'] = this.isExplain;
    data['explain_url'] = this.explainUrl;
    data['count_questions'] = this.countQuestions;
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  QuestionSubjectModel decode(json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    subjectId = json['subject_id'];
    pageNo = json['page_no'];
    isExplain = json['is_explain'];
    explainUrl = json['explain_url'];
    countQuestions = json['count_questions'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
    return this;
  }
}

class Questions {
  int? id;
  int? typeId;
  int? classId;
  int? subjectId;
  int? pageId;
  String? title;
  String? titleExtra;
  String? hint;
  String? answerIsNumber;
  List<String>? answer;
  List<String>? valid;
  String? orderBy;
  String? media;
  String? details;
  String? updatedAt;
  int? isTemplate;
  int? isActive;
  String? questionMedia;
  int? teacherId;
  String? titleAudio;
  String? optionStyle;

  Questions(
      {this.id,
      this.typeId,
      this.classId,
      this.subjectId,
      this.pageId,
      this.title,
      this.titleExtra,
      this.hint,
      this.answerIsNumber,
      this.answer,
      this.valid,
      this.orderBy,
      this.media,
      this.details,
      this.updatedAt,
      this.isTemplate,
      this.isActive,
      this.questionMedia,
      this.teacherId,
      this.titleAudio,
      this.optionStyle});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    classId = json['class_id'];
    subjectId = json['subject_id'];
    pageId = json['page_id'];
    title = json['title'];
    titleExtra = json['title_extra'];
    hint = json['hint'];
    answerIsNumber = json['answer_is_number'];
    answer = json['answer'].cast<String>();
    valid = json['valid'].cast<String>();
    orderBy = json['order_by'];
    media = json['media'];
    details = json['details'];
    updatedAt = json['updated_at'];
    isTemplate = json['is_template'];
    isActive = json['is_active'];
    questionMedia = json['question_media'];
    teacherId = json['teacher_id'];
    titleAudio = json['title_audio'];
    optionStyle = json['option_style'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['class_id'] = this.classId;
    data['subject_id'] = this.subjectId;
    data['page_id'] = this.pageId;
    data['title'] = this.title;
    data['title_extra'] = this.titleExtra;
    data['hint'] = this.hint;
    data['answer_is_number'] = this.answerIsNumber;
    data['answer'] = this.answer;
    data['valid'] = this.valid;
    data['order_by'] = this.orderBy;
    data['media'] = this.media;
    data['details'] = this.details;
    data['updated_at'] = this.updatedAt;
    data['is_template'] = this.isTemplate;
    data['is_active'] = this.isActive;
    data['question_media'] = this.questionMedia;
    data['teacher_id'] = this.teacherId;
    data['title_audio'] = this.titleAudio;
    data['option_style'] = this.optionStyle;
    return data;
  }
}
