import 'package:shater/core/network/decodable.dart';
import 'package:shater/data/model/user.dart';

class CommentModel extends Decodable<CommentModel> {
  int? id;
  int? videoId;
  int? userId;
  String? comment;
  int? isRead;
  int? isValid;
  User? user;

  CommentModel(
      {this.id,
      this.videoId,
      this.userId,
      this.comment,
      this.isRead,
      this.isValid,
      this.user});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoId = json['video_id'];
    userId = json['user_id'];
    comment = json['comment'];
    isRead = json['is_read'];
    isValid = json['is_valid'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_id'] = this.videoId;
    data['user_id'] = this.userId;
    data['comment'] = this.comment;
    data['is_read'] = this.isRead;
    data['is_valid'] = this.isValid;
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    return data;
  }

  @override
  CommentModel decode(json) {
    id = json['id'];
    videoId = json['video_id'];
    userId = json['user_id'];
    comment = json['comment'];
    isRead = json['is_read'];
    isValid = json['is_valid'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    return this;
  }
}
