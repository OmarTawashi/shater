import 'package:shater/core/network/decodable.dart';

class Subject  extends Decodable<Subject>{
  String? title;
  int? isActiveLearning;
  int? id;
  int? countQuestions;
  int? teacherCountVideo;
  int? pagesCount;
  String? image;

  Subject(
      {this.title,
      this.id,
      this.isActiveLearning,
      this.countQuestions,
      this.teacherCountVideo,
      this.pagesCount,
      this.image});

  Subject.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    isActiveLearning = json['is_active_learning'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    pagesCount = json['pages_count'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['id'] = this.id;
    data['is_active_learning'] = this.isActiveLearning;
    data['count_questions'] = this.countQuestions;
    data['teacher_count_video'] = this.teacherCountVideo;
    data['pages_count'] = this.pagesCount;
    data['image'] = this.image;
    return data;
  }
  
  @override
  Subject decode(json) {
  title = json['title'];
  id = json['id'];
    isActiveLearning = json['is_active_learning'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    pagesCount = json['pages_count'];
    image = json['image'];

  return this;
  }
}