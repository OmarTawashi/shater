import 'package:shater/core/network/decodable.dart';

class SpecificPageExercisesModel extends Decodable<SpecificPageExercisesModel> {
  bool? status;
  String? message;
  List<Items>? items;
  List<dynamic>? errors;

  SpecificPageExercisesModel({
    this.status,
    this.message,
    this.items,
    this.errors,
  });

  SpecificPageExercisesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    errors = json['errors'];
  }

  @override
  SpecificPageExercisesModel decode(json) {
    return SpecificPageExercisesModel.fromJson(json);
  }
}

class Items {
  int? id;
  String? title;
  String? image;
  int? subjectId;
  int? pageNo;
  bool? isExplain;
  String? explainUrl;
  int? countQuestions;
  List<Questions>? questions;

  Items({
    this.id,
    this.title,
    this.image,
    this.subjectId,
    this.pageNo,
    this.isExplain,
    this.explainUrl,
    this.countQuestions,
    this.questions,
  });

  Items.fromJson(Map<String, dynamic> json) {
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
        questions!.add(Questions.fromJson(v));
      });
    }
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
  dynamic answer;
  List<String>? valid;
  String? media;
  List<Map<String, dynamic>>? urls;
  String? details;
  String? updatedAt;
  int? isTemplate;
  int? isActive;
  String? questionMedia;
  int? teacherId;
  String? titleAudio;
  String? optionStyle;
  Teacher? teacher;

  Questions({
    this.id,
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
    this.media,
    this.urls,
    this.details,
    this.updatedAt,
    this.isTemplate,
    this.isActive,
    this.questionMedia,
    this.teacherId,
    this.titleAudio,
    this.optionStyle,
    this.teacher,
  });

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
    answer = json['answer'];
    valid = json['valid']?.cast<String>();
    media = json['media'];
    if (json['urls'] != null) {
      urls = <Map<String, dynamic>>[];
      json['urls'].forEach((v) {
        urls!.add(v);
      });
    }
    details = json['details'];
    updatedAt = json['updated_at'];
    isTemplate = json['is_template'];
    isActive = json['is_active'];
    questionMedia = json['question_media'];
    teacherId = json['teacher_id'];
    titleAudio = json['title_audio'];
    optionStyle = json['option_style'];
    teacher =
        json['teacher'] != null ? Teacher.fromJson(json['teacher']) : null;
  }
}

class Teacher {
  int? id;
  String? name;
  String? email;
  int? countryId;
  String? image;
  String? fCMToken;
  String? deviceType;
  String? apiToken;
  int? videoNotification;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? isNew;
  int? isTeacher;
  int? subjectId;
  int? accountTypeId;
  String? about;
  int? canCreateQuestion;
  int? cityId;
  int? schoolId;
  int? canEditQuestion;
  int? canComment;
  int? isOnline;
  int? countVideo;
  int? countQuestions;
  int? countStar;
  int? rate;
  int? isNotify;
  int? isFav;
  int? teacherRate;
  int? unreadNotification;

  Teacher({
    this.id,
    this.name,
    this.email,
    this.countryId,
    this.image,
    this.fCMToken,
    this.deviceType,
    this.apiToken,
    this.videoNotification,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.isNew,
    this.isTeacher,
    this.subjectId,
    this.accountTypeId,
    this.about,
    this.canCreateQuestion,
    this.cityId,
    this.schoolId,
    this.canEditQuestion,
    this.canComment,
    this.isOnline,
    this.countVideo,
    this.countQuestions,
    this.countStar,
    this.rate,
    this.isNotify,
    this.isFav,
    this.teacherRate,
    this.unreadNotification,
  });

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    countryId = json['country_id'];
    image = json['image'];
    fCMToken = json['FCM_token'];
    deviceType = json['device_type'];
    apiToken = json['api_token'];
    videoNotification = json['video_notification'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isNew = json['is_new'];
    isTeacher = json['is_teacher'];
    subjectId = json['subject_id'];
    accountTypeId = json['account_type_id'];
    about = json['about'];
    canCreateQuestion = json['can_create_question'];
    cityId = json['city_id'];
    schoolId = json['school_id'];
    canEditQuestion = json['can_edit_question'];
    canComment = json['can_comment'];
    isOnline = json['is_online'];
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    countStar = json['count_star'];
    rate = json['rate'];
    isNotify = json['is_notify'];
    isFav = json['is_fav'];
    teacherRate = json['teacher_rate'];
    unreadNotification = json['unread_notification'];
  }
}
