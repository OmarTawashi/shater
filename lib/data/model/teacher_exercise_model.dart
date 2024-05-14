import 'package:shater/core/network/decodable.dart';
import 'package:shater/data/model/comment_model.dart';
import 'package:shater/data/model/subject_model.dart';
import 'package:shater/data/model/subject_video_model.dart';
import 'package:shater/data/model/user.dart';

class TeacherExerciseModel extends Decodable<TeacherExerciseModel> {
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
  dynamic data;
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
  List<CommentModel>? comments;

  TeacherExerciseModel(
      {this.id,
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
      this.data,
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
      this.comments});

  TeacherExerciseModel.fromJson(Map<String, dynamic> json) {
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
    data = json['data'];
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
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments?.add(CommentModel.fromJson(v));
      });
    }
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
    data['data'] = this.data;
    data['rate'] = this.rate;
    data['is_notify'] = this.isNotify;
    data['countComment'] = this.countComment;
    data['is_like'] = this.isLike;
    data['like_count'] = this.likeCount;
    data['video_questions_count'] = this.videoQuestionsCount;
    data['questions_count'] = this.questionsCount;
    if (this.page != null) {
      data['page'] = this.page?.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    if (this.subject != null) {
      data['subject'] = this.subject?.toJson();
    }
    if (this.comments != null) {
      data['comments'] = this.comments?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  TeacherExerciseModel decode(json) {
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
    data = json['data'];
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
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments?.add(CommentModel.fromJson(v));
      });
    }
    return this;
  }
}
