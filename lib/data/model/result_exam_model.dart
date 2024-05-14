import 'package:shater/core/network/decodable.dart';

class ResultExam extends Decodable<ResultExam> {
  int? id;
  String? title;
  String? image;
  int? classId;
  int? levelId;
  int? isActiveLearning;
  String? updatedAt;
  Exam? firstExam;
  Exam? lastExam;
  int? countVideo;
  int? countQuestions;
  int? teacherCountVideo;
  int? countTeacher;
  int? isNotify;
  int? pagesCount;

  ResultExam(
      {this.id,
      this.title,
      this.image,
      this.classId,
      this.levelId,
      this.isActiveLearning,
      this.updatedAt,
      this.firstExam,
      this.lastExam,
      this.countVideo,
      this.countQuestions,
      this.teacherCountVideo,
      this.countTeacher,
      this.isNotify,
      this.pagesCount});

  ResultExam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    classId = json['class_id'];
    levelId = json['level_id'];
    isActiveLearning = json['is_active_learning'];
    updatedAt = json['updated_at'];
    firstExam = json['first_exam'] != null
        ? new Exam.fromJson(json['first_exam'])
        : null;
    lastExam =
        json['last_exam'] != null ? new Exam.fromJson(json['last_exam']) : null;
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    countTeacher = json['count_teacher'];
    isNotify = json['is_notify'];
    pagesCount = json['pages_count'];
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
    if (this.firstExam != null) {
      data['first_exam'] = this.firstExam?.toJson();
    }
    if (this.lastExam != null) {
      data['last_exam'] = this.lastExam?.toJson();
    }
    data['count_video'] = this.countVideo;
    data['count_questions'] = this.countQuestions;
    data['teacher_count_video'] = this.teacherCountVideo;
    data['count_teacher'] = this.countTeacher;
    data['is_notify'] = this.isNotify;
    data['pages_count'] = this.pagesCount;
    return data;
  }

  @override
  ResultExam decode(json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    classId = json['class_id'];
    levelId = json['level_id'];
    isActiveLearning = json['is_active_learning'];
    updatedAt = json['updated_at'];
    firstExam = json['first_exam'] != null
        ? new Exam.fromJson(json['first_exam'])
        : null;
    lastExam =
        json['last_exam'] != null ? new Exam.fromJson(json['last_exam']) : null;
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    countTeacher = json['count_teacher'];
    isNotify = json['is_notify'];
    pagesCount = json['pages_count'];
    return this;
  }
}

class Exam {
  int? id;
  int? total;
  int? studentId;
  int? subjectId;
  int? countryId;
  int? classId;
  int? fromPageNo;
  int? toPageNo;
  String? createdAt;
  String? updatedAt;
  int? helpAnswer;
  int? totalCorrect;
  int? totalFalse;
  int? countStar;
  int? countStarFalse;

  Exam(
      {this.id,
      this.total,
      this.studentId,
      this.subjectId,
      this.countryId,
      this.classId,
      this.fromPageNo,
      this.toPageNo,
      this.createdAt,
      this.updatedAt,
      this.helpAnswer,
      this.totalCorrect,
      this.totalFalse,
      this.countStar,
      this.countStarFalse});

  Exam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    studentId = json['student_id'];
    subjectId = json['subject_id'];
    countryId = json['country_id'];
    classId = json['class_id'];
    fromPageNo = json['from_page_no'];
    toPageNo = json['to_page_no'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    helpAnswer = json['help_answer'];
    totalCorrect = json['total_correct'];
    totalFalse = json['total_false'];
    countStar = json['count_star'];
    countStarFalse = json['count_star_false'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['student_id'] = this.studentId;
    data['subject_id'] = this.subjectId;
    data['country_id'] = this.countryId;
    data['class_id'] = this.classId;
    data['from_page_no'] = this.fromPageNo;
    data['to_page_no'] = this.toPageNo;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['help_answer'] = this.helpAnswer;
    data['total_correct'] = this.totalCorrect;
    data['total_false'] = this.totalFalse;
    data['count_star'] = this.countStar;
    data['count_star_false'] = this.countStarFalse;
    return data;
  }
}
