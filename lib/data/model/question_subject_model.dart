import 'package:shater/core/network/decodable.dart';
import 'package:shater/data/model/typing_answer.dart';

class QuestionPageModel extends Decodable<QuestionPageModel> {
  int? id;
  String? image;
  int? subjectId;
  String? title;
  int? pageNo;
  bool? isExplain;
  String? explainUrl;
  int? countQuestions;
  List<QuestionModel?>? questions;

  QuestionPageModel({
    this.id,
    this.image,
    this.subjectId,
    this.title,
    this.explainUrl,
    this.pageNo,
    this.isExplain,
    this.countQuestions,
    this.questions,
  });

  QuestionPageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    subjectId = json['subject_id'];
    isExplain = json['is_explain'];
    explainUrl = json['explain_url'];
    title = json['title'];
    pageNo = json['page_no'];
    countQuestions = json['count_questions'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((value) {
        questions?.add(QuestionModel.fromJson(value));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'subject_id': subjectId,
      'title': title,
      'page_no': pageNo,
      'questions': questions?.map((e) => e?.toJson()).toList(),
    };
  }

  @override
  QuestionPageModel decode(json) {
    id = json['id'];
    image = json['image'];
    subjectId = json['subject_id'];
    isExplain = json['is_explain'];
    explainUrl = json['explain_url'];
    title = json['title'];
    pageNo = json['page_no'];
    countQuestions = json['count_questions'];
    if (json['questions'] != null) {
      questions = [];
      json['questions'].forEach((value) {
        questions?.add(QuestionModel.fromJson(value));
      });
    }

    return this;
  }
}

class QuestionModel {
  int? id;
  int? typeId;
  int? classId;
  int? subjectId;
  int? pageId;
  bool? isValid;
  String? title;
  String? titleExtra;
  String? hint;
  String? answerIsNumber;
  List<dynamic>? answer;
  List<dynamic>? valid;
  Map<String, dynamic>? orderBy;
  String? media;
  List<dynamic>? urls;
  String? updatedAt;
  int? isTemplate;
  int? isActive;
   TypingAnswer? typingAnswer;
  List<dynamic>? details;
  String? questionMedia;
  int? teacherId;
  String? titleAudio;
  String? optionStyle;

  QuestionModel(
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
      this.isValid,
      this.media,
      this.typingAnswer,
      this.urls,
      this.updatedAt,
      this.details,
      this.isTemplate,
      this.isActive,
      this.questionMedia,
      this.teacherId,
      this.titleAudio,
      this.optionStyle});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    classId = json['class_id'];
    subjectId = json['subject_id'];
    pageId = json['page_id'];
    title = json['title'];
    titleExtra = json['title_extra'];
    hint = json['hint'];
    answerIsNumber = json['answer_is_number'];
    if (json['order_by'] is List) {
      orderBy = json['order_by'].first;
    } else {
      orderBy = json['order_by'];
    }
    media = json['media'];
    if (json['answer'] is String ||
        json['answer'] is int ||
        json['answer'] is bool) {
      answer = [];
      answer?.add(json['answer']);
    } else {
      answer = json['answer'];
    }
    valid = json['valid'];
    urls = json['urls'];
    updatedAt = json['updated_at'];
    isTemplate = json['is_template'];
    isActive = json['is_active'];
    details = json['details'];
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
    if (this.urls != null) {
      data['urls'] = this.urls;
    }
    data['updated_at'] = this.updatedAt;
    data['details'] = this.details;
    data['is_template'] = this.isTemplate;
    data['is_active'] = this.isActive;
    data['question_media'] = this.questionMedia;
    data['teacher_id'] = this.teacherId;
    data['title_audio'] = this.titleAudio;
    data['option_style'] = this.optionStyle;
    return data;
  }
}
