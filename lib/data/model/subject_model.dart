import 'package:shater/core/network/decodable.dart';

class Subject  extends Decodable<Subject>{
  String? title;
  int? isActiveLearning;
  int? countQuestions;
  int? teacherCountVideo;
  int? pagesCount;

  Subject(
      {this.title,
      this.isActiveLearning,
      this.countQuestions,
      this.teacherCountVideo,
      this.pagesCount});

  Subject.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    isActiveLearning = json['is_active_learning'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    pagesCount = json['pages_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['is_active_learning'] = this.isActiveLearning;
    data['count_questions'] = this.countQuestions;
    data['teacher_count_video'] = this.teacherCountVideo;
    data['pages_count'] = this.pagesCount;
    return data;
  }
  
  @override
  Subject decode(json) {
  title = json['title'];
    isActiveLearning = json['is_active_learning'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    pagesCount = json['pages_count'];
    return this;
  }
}