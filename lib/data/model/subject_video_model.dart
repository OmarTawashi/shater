import 'package:shater/core/network/decodable.dart';

class SubjectVideo extends Decodable<SubjectVideo> {
  int? id;
  int? pageNo;
  int? subjectId;
  int? pageId;
  Page? page;
  String? url;
  UserTeacher? user;
  int? isNotify;
  int? questionsCount;

  SubjectVideo(
      {this.id,
      this.pageNo,
      this.subjectId,
      this.pageId,
      this.page,
      this.url,
      this.user,
      this.isNotify,
      this.questionsCount});

  SubjectVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageNo = json['page_no'];
    subjectId = json['subject_id'];
    pageId = json['page_id'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    url = json['url'];
    user = json['user'] != null ? new UserTeacher.fromJson(json['user']) : null;
    isNotify = json['is_notify'];
    questionsCount = json['questions_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['page_no'] = this.pageNo;
    data['subject_id'] = this.subjectId;
    data['page_id'] = this.pageId;
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    data['url'] = this.url;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['is_notify'] = this.isNotify;
    data['questions_count'] = this.questionsCount;
    return data;
  }

  @override
  SubjectVideo decode(json) {
    id = json['id'];
    pageNo = json['page_no'];
    subjectId = json['subject_id'];
    pageId = json['page_id'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    url = json['url'];
    user = json['user'] != null ? new UserTeacher.fromJson(json['user']) : null;
    isNotify = json['is_notify'];
    questionsCount = json['questions_count'];
    return this;
  }
}

class Page {
  int? id;
  String? title;
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

class UserTeacher {
  int? id;
  String? name;
  String? image;

  UserTeacher({this.id, this.name, this.image});

  UserTeacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
