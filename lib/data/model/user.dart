import 'package:shater/core/network/decodable.dart';
import 'package:shater/data/model/class_model.dart';
import 'package:shater/data/model/country_model.dart';
import 'package:shater/data/model/public_model.dart';
import 'package:shater/data/model/school_model.dart';
import 'package:shater/data/model/subject_model.dart';

class User extends Decodable<User> {
  var id;
  String? name;
  String? email;
  var classId;
  var levelId;
  var countryId;
  String? image;
  String? fCMToken;
  String? deviceType;
  String? apiToken;
  var videoNotification;
  String? status;
  String? createdAt;
  String? updatedAt;
  var isNew;
  var isTeacher;
  var subjectId;
  var accountTypeId;
  String? about;
  var canCreateQuestion;
  var cityId;
  var schoolId;
  var canEditQuestion;
  String? loginAt;
  var parentId;
  var canComment;
  var isOnline;
  var countVideo;
  var countQuestions;
  var countStar;
  String? rate;
  var rateStar;
  var isNotify;
  var isFav;
  var teacherRate;
  var unreadNotification;
  var experienceYears;
  Subject? subject;
  List<Classes>? teacherClass;
  Classes? classes;
  Country? country;
  List<PublicModel>? level;
  School? school;
  PublicModel? city;
  List<ChildUser>? children;

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
      this.parentId,
      this.canComment,
      this.isOnline,
      this.countVideo,
      this.countQuestions,
      this.experienceYears,
      this.countStar,
      this.rate,
      this.isNotify,
      this.isFav,
      this.teacherRate,
      this.unreadNotification,
      this.subject,
      this.teacherClass,
      this.classes,
      this.country,
      this.level,
      this.school,
      this.city,
      this.children});

  @override
  User decode(dynamic json) {
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
    rateStar = json['rate_star'];
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
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    countStar = json['count_star'];
    rate = "${json['rate']}";
    isNotify = json['is_notify'];
    isFav = json['is_fav'];
    teacherRate = json['teacher_rate'];
    experienceYears = json['experience_years'];
    unreadNotification = json['unread_notification'];
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    if (json['teacher_class'] != null) {
      teacherClass = [];
      json['teacher_class'].forEach((v) {
        teacherClass?.add(new Classes.fromJson(v));
      });
    }
    if (json['classes'] is List) {
      // teacherClass = [];
      // json['classes'].forEach((v) {
      //   teacherClass?.add(new Classes.fromJson(v));
      // });
    } else {
      classes = json['classes'] != null
          ? new Classes.fromJson(json['classes'])
          : null;
    }

    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    // if (json['level'] != null) {
    //   level = new List<Null>();
    //   json['level'].forEach((v) {
    //     level?.add(new Null.fromJson(v));
    //   });
    // }
    school =
        json['school'] != null ? new School.fromJson(json['school']) : null;
    city = json['city'] != null ? new PublicModel.fromJson(json['city']) : null;

    children = json["children"] == null
        ? null
        : List<ChildUser>.from(
        json["children"].map((x) => ChildUser.fromJson(x)));

    // if (json['children'] != null) {
    //   children = new List<Null>();
    //   json['children'].forEach((v) {
    //     children?.add(new Null.fromJson(v));
    //   });
    // }

    return this;
  }

  User.fromJson(json) {
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
    rateStar = json['rate_star'];
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
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    countStar = json['count_star'];
    rate = "${json['rate']}";
    isNotify = json['is_notify'];
    isFav = json['is_fav'];
    teacherRate = json['teacher_rate'];
    unreadNotification = json['unread_notification'];
    experienceYears = json['experience_years'];
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
    if (json['teacher_class'] != null) {
      teacherClass = [];
      json['teacher_class'].forEach((v) {
        teacherClass?.add(new Classes.fromJson(v));
      });
    }
    if (json['classes'] is List) {
      // teacherClass = [];
      // json['classes'].forEach((v) {
      //   teacherClass?.add(new Classes.fromJson(v));
      // });
    } else {
      classes = json['classes'] != null
          ? new Classes.fromJson(json['classes'])
          : null;
    }

    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
    // if (json['level'] != null) {
    //   level = new List<Null>();
    //   json['level'].forEach((v) {
    //     level?.add(new Null.fromJson(v));
    //   });
    // }
    school =
        json['school'] != null ? new School.fromJson(json['school']) : null;
    city = json['city'] != null ? new PublicModel.fromJson(json['city']) : null;

    children = json["children"] == null
        ? null
        : List<ChildUser>.from(
        json["children"].map((x) => ChildUser.fromJson(x)));

    // if (json['children'] != null) {
    //   children = new List<Null>();
    //   json['children'].forEach((v) {
    //     children?.add(new Null.fromJson(v));
    //   });
    // }
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
    data['count_video'] = this.countVideo;
    data['count_questions'] = this.countQuestions;
    data['count_star'] = this.countStar;
    data['rate'] = this.rate;
    data['is_notify'] = this.isNotify;
    data['is_fav'] = this.isFav;
    data['teacher_rate'] = this.teacherRate;
    data['unread_notification'] = this.unreadNotification;
    data['experience_years'] = experienceYears;
    if (this.subject != null) {
      data['subject'] = this.subject?.toJson();
    }
    // if (this.teacherClass != null) {
    //   data['teacher_class'] = this.teacherClass.map((v) => v.toJson()).toList();
    // }
    if (this.classes != null) {
      data['classes'] = this.classes?.toJson();
    }
    if (this.country != null) {
      data['country'] = this.country?.toJson();
    }
    // if (this.level != null) {
    //   data['level'] = this.level?.map((v) => v.toJson()).toList();
    // }
    if (this.school != null) {
      data['school'] = this.school?.toJson();
    }
    if (this.city != null) {
      data['city'] = this.city?.toJson();
    }
    data['children'] = List<ChildUser>.from((children??[]).map((x) => x));




    // if (this.children != null) {
    //   data['children'] = this.children?.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class ChildUser extends Decodable<ChildUser> {
  var id;
  String? name;
  String? email;
  var classId;
  var levelId;
  var countryId;
  String? image;
  String? fCMToken;
  String? deviceType;
  String? apiToken;
  var videoNotification;
  String? status;
  String? createdAt;
  String? updatedAt;
  var isNew;
  var isTeacher;
  var subjectId;
  var accountTypeId;
  String? about;
  var canCreateQuestion;
  var cityId;
  var schoolId;
  var canEditQuestion;
  String? loginAt;
  var parentId;
  var canComment;
  var isOnline;
  var countVideo;
  var countQuestions;
  var countStar;
  String? rate;
  var isNotify;
  var isFav;
  var teacherRate;
  var unreadNotification;


  ChildUser(
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
        this.countVideo,
        this.countQuestions,
        this.countStar,
        this.rate,
        this.isNotify,
        this.isFav,
        this.teacherRate,
        this.unreadNotification,});

  @override
  ChildUser decode(dynamic json) {
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
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    countStar = json['count_star'];
    rate = "${json['rate']}";
    isNotify = json['is_notify'];
    isFav = json['is_fav'];
    teacherRate = json['teacher_rate'];
    unreadNotification = json['unread_notification'];

    return this;
  }

  ChildUser.fromJson(json) {
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
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    countStar = json['count_star'];
    rate = "${json['rate']}";
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
    data['parent_id'] = this.parentId;
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


