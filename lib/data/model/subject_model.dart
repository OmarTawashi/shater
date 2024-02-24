import 'package:shater/core/network/decodable.dart';

class Subject extends Decodable<Subject> {
  int? countVideo;
  int? countQuestions;
  int? teacherCountVideo;
  int? countTeacher;
  int? isNotify;
  int? pagesCount;

  Subject(
      {this.countVideo,
      this.countQuestions,
      this.teacherCountVideo,
      this.countTeacher,
      this.isNotify,
      this.pagesCount});

  Subject.fromJson(Map<String, dynamic> json) {
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    countTeacher = json['count_teacher'];
    isNotify = json['is_notify'];
    pagesCount = json['pages_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count_video'] = this.countVideo;
    data['count_questions'] = this.countQuestions;
    data['teacher_count_video'] = this.teacherCountVideo;
    data['count_teacher'] = this.countTeacher;
    data['is_notify'] = this.isNotify;
    data['pages_count'] = this.pagesCount;
    return data;
  }
  
  @override
  Subject decode(json) {
     countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    countTeacher = json['count_teacher'];
    isNotify = json['is_notify'];
    pagesCount = json['pages_count'];
    return this;
  }
}