import 'package:shater/core/network/decodable.dart';
import 'package:shater/data/model/class_model.dart';

class CourseLearningModel extends Decodable<CourseLearningModel> {
  int? id;
  String? title;
  String? image;
  int? classId;
  int? levelId;
  int? isActiveLearning;
  String? updatedAt;
  int? countVideo;
  int? countQuestions;
  int? teacherCountVideo;
  int? countTeacher;
  int? isNotify;
  int? pagesCount;
  bool?hasSubscription;

  Classes? classes;

  CourseLearningModel(
      {this.id,
      this.title,
      this.image,
      this.classId,
      this.levelId,
      this.isActiveLearning,
      this.updatedAt,
      this.countVideo,
      this.countQuestions,
      this.teacherCountVideo,
      this.countTeacher,
      this.isNotify,
      this.pagesCount,
      this.classes,
      this.hasSubscription
      });

  CourseLearningModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    classId = json['class_id'];
    levelId = json['level_id'];
    isActiveLearning = json['is_active_learning'];
    updatedAt = json['updated_at'];
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    countTeacher = json['count_teacher'];
    isNotify = json['is_notify'];
    pagesCount = json['pages_count'];
    hasSubscription = json['has_subscription'];


    if (json['classes'] != null) {
      classes = new Classes.fromJson(json['classes']);
    }
  }


  @override
  CourseLearningModel decode(json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    classId = json['class_id'];
    levelId = json['level_id'];
    isActiveLearning = json['is_active_learning'];
    updatedAt = json['updated_at'];
    countVideo = json['count_video'];
    countQuestions = json['count_questions'];
    teacherCountVideo = json['teacher_count_video'];
    countTeacher = json['count_teacher'];
    isNotify = json['is_notify'];
    pagesCount = json['pages_count'];
    hasSubscription = json['has_subscription'];

    if (json['classes'] != null) {
      classes = new Classes.fromJson(json['classes']);
    }
    return this;
  }
}
