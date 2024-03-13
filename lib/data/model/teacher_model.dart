import 'package:shater/core/network/decodable.dart';
import 'package:shater/data/model/rate_school_model.dart';

class TeacherModel extends Decodable<TeacherModel> {
  int? id;
  String? name;
  String? email;
  int? classId;
  int? levelId;
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
  String? loginAt;
  int? parentId;
  int? canComment;
  int? isOnline;
  String? lastVideoAdded;
  int? countVideo;
  int? countQuestions;
  int? countStar;
  int? rate;
  int? isNotify;
  int? isFav;
  int? teacherRate;
  int? unreadNotification;
  List<School>? school;
  String? story;

  TeacherModel(
      {this.id,
      this.name,
      this.email,
      this.classId,
      this.levelId,
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
      this.loginAt,
      this.parentId,
      this.canComment,
      this.isOnline,
      this.lastVideoAdded,
      this.countVideo,
      this.countQuestions,
      this.countStar,
      this.rate,
      this.isNotify,
      this.isFav,
      this.teacherRate,
      this.unreadNotification,
      this.school,
      this.story});

  TeacherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    classId = json['class_id'];
    levelId = json['level_id'];
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
    loginAt = json['login_at'];
    parentId = json['parent_id'];
    canComment = json['can_comment'];
    isOnline = json['is_online'];
    lastVideoAdded = json['last_video_added'];
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    countStar = json['count_star'];
    rate = json['rate'];
    isNotify = json['is_notify'];
    isFav = json['is_fav'];
    teacherRate = json['teacher_rate'];
    unreadNotification = json['unread_notification'];
    if (json['school'] != null) {
      school = <School>[];
      json['school'].forEach((v) {
        school!.add(new School.fromJson(v));
      });
    }
    story = json['story'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['class_id'] = this.classId;
    data['level_id'] = this.levelId;
    data['country_id'] = this.countryId;
    data['image'] = this.image;
    data['FCM_token'] = this.fCMToken;
    data['device_type'] = this.deviceType;
    data['api_token'] = this.apiToken;
    data['video_notification'] = this.videoNotification;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_new'] = this.isNew;
    data['is_teacher'] = this.isTeacher;
    data['subject_id'] = this.subjectId;
    data['account_type_id'] = this.accountTypeId;
    data['about'] = this.about;
    data['can_create_question'] = this.canCreateQuestion;
    data['city_id'] = this.cityId;
    data['school_id'] = this.schoolId;
    data['can_edit_question'] = this.canEditQuestion;
    data['login_at'] = this.loginAt;
    data['parent_id'] = this.parentId;
    data['can_comment'] = this.canComment;
    data['is_online'] = this.isOnline;
    data['last_video_added'] = this.lastVideoAdded;
    data['count_video'] = this.countVideo;
    data['count_questions'] = this.countQuestions;
    data['count_star'] = this.countStar;
    data['rate'] = this.rate;
    data['is_notify'] = this.isNotify;
    data['is_fav'] = this.isFav;
    data['teacher_rate'] = this.teacherRate;
    data['unread_notification'] = this.unreadNotification;
    if (this.school != null) {
      data['school'] = this.school!.map((v) => v.toJson()).toList();
    }
    data['story'] = this.story;
    return data;
  }
  
  @override
  TeacherModel decode(json) {
     id = json['id'];
    name = json['name'];
    email = json['email'];
    classId = json['class_id'];
    levelId = json['level_id'];
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
    loginAt = json['login_at'];
    parentId = json['parent_id'];
    canComment = json['can_comment'];
    isOnline = json['is_online'];
    lastVideoAdded = json['last_video_added'];
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    countStar = json['count_star'];
    rate = json['rate'];
    isNotify = json['is_notify'];
    isFav = json['is_fav'];
    teacherRate = json['teacher_rate'];
    unreadNotification = json['unread_notification'];
    if (json['school'] != null) {
      school = <School>[];
      json['school'].forEach((v) {
        school?.add(new School.fromJson(v));
      });
    }
    story = json['story'];
    return this;
  }
}