

import 'package:shater/core/network/decodable.dart';

class VedioSubjectTeacher extends Decodable<VedioSubjectTeacher> {
  bool? status;
  String? message;
  List<Items>? items;

  VedioSubjectTeacher({
    this.status,
    this.message,
    this.items,
  });

  VedioSubjectTeacher.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }

    return data;
  }
  
  @override
  VedioSubjectTeacher decode(json) {
    status = json['status'];
    message = json['message'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }

    return this;
  }

 
}

class Items {
  int? id;
  String? url;
  int? userId;
  int? subjectId;
  int? pageId;
  int? pageNo;
  int? publish;
  int? readNotification;
  String? createdAt;
  String? updatedAt;
  int? publishTo;

  int? rate;
  int? isNotify;
  int? countComment;
  int? isLike;
  int? likeCount;
  int? videoQuestionsCount;
  int? questionsCount;
  Page? page;
  User? user;
  Subject? subject;

  Items({
    this.id,
    this.url,
    this.userId,
    this.subjectId,
    this.pageId,
    this.pageNo,
    this.publish,
    this.readNotification,
    this.createdAt,
    this.updatedAt,
    this.publishTo,
    this.rate,
    this.isNotify,
    this.countComment,
    this.isLike,
    this.likeCount,
    this.videoQuestionsCount,
    this.questionsCount,
    this.page,
    this.user,
    this.subject,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    userId = json['user_id'];
    subjectId = json['subject_id'];
    pageId = json['page_id'];
    pageNo = json['page_no'];
    publish = json['publish'];
    readNotification = json['read_notification'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    publishTo = json['publish_to'];

    rate = json['rate'];
    isNotify = json['is_notify'];
    countComment = json['countComment'];
    isLike = json['is_like'];
    likeCount = json['like_count'];
    videoQuestionsCount = json['video_questions_count'];
    questionsCount = json['questions_count'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['user_id'] = this.userId;
    data['subject_id'] = this.subjectId;
    data['page_id'] = this.pageId;
    data['page_no'] = this.pageNo;
    data['publish'] = this.publish;
    data['read_notification'] = this.readNotification;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['publish_to'] = this.publishTo;

    data['rate'] = this.rate;
    data['is_notify'] = this.isNotify;
    data['countComment'] = this.countComment;
    data['is_like'] = this.isLike;
    data['like_count'] = this.likeCount;
    data['video_questions_count'] = this.videoQuestionsCount;
    data['questions_count'] = this.questionsCount;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }

    return data;
  }


}

class Page {
  int? id;
  dynamic title;
  String? image;
  int? subjectId;
  int? pageNo;
  bool? isExplain;
  String? explainUrl;
  int? countQuestions;

  Page(
      {this.id,
      this.title,
      this.image,
      this.subjectId,
      this.pageNo,
      this.isExplain,
      this.explainUrl,
      this.countQuestions});

  Page.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    subjectId = json['subject_id'];
    pageNo = json['page_no'];
    isExplain = json['is_explain'];
    explainUrl = json['explain_url'];
    countQuestions = json['count_questions'];
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
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic classId;
  dynamic levelId;
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

  User(
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
      this.canComment,
      this.isOnline,
      this.countVideo,
      this.countQuestions,
      this.countStar,
      this.rate,
      this.isNotify,
      this.isFav,
      this.teacherRate,
      this.unreadNotification});

  User.fromJson(Map<String, dynamic> json) {
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

    data['can_comment'] = this.canComment;
    data['is_online'] = this.isOnline;

    data['count_video'] = this.countVideo;
    data['count_questions'] = this.countQuestions;
    data['count_star'] = this.countStar;
    data['rate'] = this.rate;
    data['is_notify'] = this.isNotify;
    data['is_fav'] = this.isFav;
    data['teacher_rate'] = this.teacherRate;
    data['unread_notification'] = this.unreadNotification;
    return data;
  }
}

class Subject {
  int? id;
  String? title;
  String? image;
  int? classId;
  int? levelId;
  int? isActiveLearning;
  String? updatedAt;
  int? isPaid;
  int? pricePerMonth;
  int? pricePerYear;
  int? countVideo;
  int? countQuestions;
  int? teacherCountVideo;
  int? countTeacher;
  int? isNotify;
  int? pagesCount;
  bool? hasSubscription;

  Subject(
      {this.id,
      this.title,
      this.image,
      this.classId,
      this.levelId,
      this.isActiveLearning,
      this.updatedAt,
      this.isPaid,
      this.pricePerMonth,
      this.pricePerYear,
      this.countVideo,
      this.countQuestions,
      this.teacherCountVideo,
      this.countTeacher,
      this.isNotify,
      this.pagesCount,
      this.hasSubscription});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    classId = json['class_id'];
    levelId = json['level_id'];
    isActiveLearning = json['is_active_learning'];
    updatedAt = json['updated_at'];
    isPaid = json['is_paid'];
    pricePerMonth = json['price_per_month'];
    pricePerYear = json['price_per_year'];
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    countTeacher = json['count_teacher'];
    isNotify = json['is_notify'];
    pagesCount = json['pages_count'];
    hasSubscription = json['has_subscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['class_id'] = this.classId;
    data['level_id'] = this.levelId;
    data['is_active_learning'] = this.isActiveLearning;
    data['updated_at'] = this.updatedAt;
    data['is_paid'] = this.isPaid;
    data['price_per_month'] = this.pricePerMonth;
    data['price_per_year'] = this.pricePerYear;
    data['count_video'] = this.countVideo;
    data['count_questions'] = this.countQuestions;
    data['teacher_count_video'] = this.teacherCountVideo;
    data['count_teacher'] = this.countTeacher;
    data['is_notify'] = this.isNotify;
    data['pages_count'] = this.pagesCount;
    data['has_subscription'] = this.hasSubscription;
    return data;
  }
}
