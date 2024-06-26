// import 'package:shater/core/network/decodable.dart';

// class SpecificPageExercisesModel extends Decodable<SpecificPageExercisesModel> {
//   bool? status;
//   String? message;
//   List<Items>? items;
//   List<String>? errors;

//   SpecificPageExercisesModel(
//       {this.status, this.message, this.items, this.errors});

//   SpecificPageExercisesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['items'] != null) {
//       items = <Items>[];
//       json['items'].forEach((v) {
//         items!.add(new Items.fromJson(v));
//       });
//     }
//     errors = json['errors'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.items != null) {
//       data['items'] = this.items!.map((v) => v.toJson()).toList();
//     }
//     data['errors'] = this.errors;
//     return data;
//   }

//   @override
//   SpecificPageExercisesModel decode(json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['items'] != null) {
//       items = <Items>[];
//       json['items'].forEach((v) {
//         items!.add(new Items.fromJson(v));
//       });
//     }
//     errors = json['errors'].cast<String>();
//     return this;
//   }
// }

// class Items {
//   int? id;
//   String? title;
//   String? image;
//   int? subjectId;
//   int? pageNo;
//   bool? isExplain;
//   String? explainUrl;
//   int? countQuestions;
//   List<Questions>? questions;

//   Items(
//       {this.id,
//       this.title,
//       this.image,
//       this.subjectId,
//       this.pageNo,
//       this.isExplain,
//       this.explainUrl,
//       this.countQuestions,
//       this.questions});

//   Items.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     image = json['image'];
//     subjectId = json['subject_id'];
//     pageNo = json['page_no'];
//     isExplain = json['is_explain'];
//     explainUrl = json['explain_url'];
//     countQuestions = json['count_questions'];
//     if (json['questions'] != null) {
//       questions = <Questions>[];
//       json['questions'].forEach((v) {
//         questions!.add(new Questions.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['image'] = this.image;
//     data['subject_id'] = this.subjectId;
//     data['page_no'] = this.pageNo;
//     data['is_explain'] = this.isExplain;
//     data['explain_url'] = this.explainUrl;
//     data['count_questions'] = this.countQuestions;
//     if (this.questions != null) {
//       data['questions'] = this.questions!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Questions {
//   int? id;
//   int? typeId;
//   int? classId;
//   int? subjectId;
//   int? pageId;
//   String? title;

//   String? answerIsNumber;
//   String? answer;
//   List<String>? valid;

//   String? media;
//   // List<Urls>? urls;

//   String? updatedAt;
//   int? isTemplate;
//   int? isActive;
//   String? questionMedia;
//   int? teacherId;

//   Teacher? teacher;

//   Questions(
//       {this.id,
//       this.typeId,
//       this.classId,
//       this.subjectId,
//       this.pageId,
//       this.title,
//       this.answerIsNumber,
//       this.answer,
//       this.valid,
//       this.media,
//       // this.urls,
//       this.updatedAt,
//       this.isTemplate,
//       this.isActive,
//       this.questionMedia,
//       this.teacherId,
//       this.teacher});

//   Questions.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     typeId = json['type_id'];
//     classId = json['class_id'];
//     subjectId = json['subject_id'];
//     pageId = json['page_id'];
//     title = json['title'];

//     answerIsNumber = json['answer_is_number'];
//     answer = json['answer'];
//     valid = json['valid'].cast<String>();

//     media = json['media'];
//     // if (json['urls'] != null) {
//     //   urls = <Urls>[];
//     //   json['urls'].forEach((v) {
//     //     urls!.add(new Urls.fromJson(v));
//     //   });
//     // }
//     ;
//     updatedAt = json['updated_at'];
//     isTemplate = json['is_template'];
//     isActive = json['is_active'];
//     questionMedia = json['question_media'];
//     teacherId = json['teacher_id'];

//     teacher =
//         json['teacher'] != null ? new Teacher.fromJson(json['teacher']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['type_id'] = this.typeId;
//     data['class_id'] = this.classId;
//     data['subject_id'] = this.subjectId;
//     data['page_id'] = this.pageId;
//     data['title'] = this.title;

//     data['answer_is_number'] = this.answerIsNumber;
//     data['answer'] = this.answer;
//     data['valid'] = this.valid;

//     data['media'] = this.media;
//     // if (this.urls != null) {
//     //   data['urls'] = this.urls!.map((v) => v.toJson()).toList();
//     // }

//     data['updated_at'] = this.updatedAt;
//     data['is_template'] = this.isTemplate;
//     data['is_active'] = this.isActive;
//     data['question_media'] = this.questionMedia;
//     data['teacher_id'] = this.teacherId;

//     if (this.teacher != null) {
//       data['teacher'] = this.teacher!.toJson();
//     }
//     return data;
//   }
// }

// // class Urls {
// //   String? image;
// //   String? s0;
// //   String? audio;
// //   String? s1;

// //   Urls({this.image, this.s0, this.audio, this.s1});

// //   Urls.fromJson(Map<String, dynamic> json) {
// //     image = json['image'];
// //     s0 = json['0'];
// //     audio = json['audio'];
// //     s1 = json['1'];
// //   }

// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = new Map<String, dynamic>();
// //     data['image'] = this.image;
// //     data['0'] = this.s0;
// //     data['audio'] = this.audio;
// //     data['1'] = this.s1;
// //     return data;
// //   }
// // }

// class Teacher {
//   int? id;
//   String? name;
//   String? email;

//   int? countryId;
//   String? image;
//   String? fCMToken;
//   String? deviceType;
//   String? apiToken;
//   int? videoNotification;
//   String? status;
//   String? createdAt;
//   String? updatedAt;
//   int? isNew;
//   int? isTeacher;
//   int? subjectId;
//   int? accountTypeId;
//   String? about;
//   int? canCreateQuestion;
//   int? cityId;
//   int? schoolId;
//   int? canEditQuestion;

//   int? canComment;
//   int? isOnline;

//   int? countVideo;
//   int? countQuestions;
//   int? countStar;
//   int? rate;
//   int? isNotify;
//   int? isFav;
//   int? teacherRate;
//   int? unreadNotification;

//   Teacher(
//       {this.id,
//       this.name,
//       this.email,
//       this.countryId,
//       this.image,
//       this.fCMToken,
//       this.deviceType,
//       this.apiToken,
//       this.videoNotification,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.isNew,
//       this.isTeacher,
//       this.subjectId,
//       this.accountTypeId,
//       this.about,
//       this.canCreateQuestion,
//       this.cityId,
//       this.schoolId,
//       this.canEditQuestion,
//       this.canComment,
//       this.isOnline,
//       this.countVideo,
//       this.countQuestions,
//       this.countStar,
//       this.rate,
//       this.isNotify,
//       this.isFav,
//       this.teacherRate,
//       this.unreadNotification});

//   Teacher.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];

//     countryId = json['country_id'];
//     image = json['image'];
//     fCMToken = json['FCM_token'];
//     deviceType = json['device_type'];
//     apiToken = json['api_token'];
//     videoNotification = json['video_notification'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     isNew = json['is_new'];
//     isTeacher = json['is_teacher'];
//     subjectId = json['subject_id'];
//     accountTypeId = json['account_type_id'];
//     about = json['about'];
//     canCreateQuestion = json['can_create_question'];
//     cityId = json['city_id'];
//     schoolId = json['school_id'];
//     canEditQuestion = json['can_edit_question'];

//     canComment = json['can_comment'];
//     isOnline = json['is_online'];

//     countVideo = json['count_video'];
//     countQuestions = json['count_questions'];
//     countStar = json['count_star'];
//     rate = json['rate'];
//     isNotify = json['is_notify'];
//     isFav = json['is_fav'];
//     teacherRate = json['teacher_rate'];
//     unreadNotification = json['unread_notification'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['email'] = this.email;

//     data['country_id'] = this.countryId;
//     data['image'] = this.image;
//     data['FCM_token'] = this.fCMToken;
//     data['device_type'] = this.deviceType;
//     data['api_token'] = this.apiToken;
//     data['video_notification'] = this.videoNotification;
//     data['status'] = this.status;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['is_new'] = this.isNew;
//     data['is_teacher'] = this.isTeacher;
//     data['subject_id'] = this.subjectId;
//     data['account_type_id'] = this.accountTypeId;
//     data['about'] = this.about;
//     data['can_create_question'] = this.canCreateQuestion;
//     data['city_id'] = this.cityId;
//     data['school_id'] = this.schoolId;
//     data['can_edit_question'] = this.canEditQuestion;

//     data['can_comment'] = this.canComment;
//     data['is_online'] = this.isOnline;

//     data['count_video'] = this.countVideo;
//     data['count_questions'] = this.countQuestions;
//     data['count_star'] = this.countStar;
//     data['rate'] = this.rate;
//     data['is_notify'] = this.isNotify;
//     data['is_fav'] = this.isFav;
//     data['teacher_rate'] = this.teacherRate;
//     data['unread_notification'] = this.unreadNotification;
//     return data;
//   }
// }
