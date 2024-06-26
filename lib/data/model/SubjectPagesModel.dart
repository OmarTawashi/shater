import 'package:shater/core/network/decodable.dart';

class SubjectPagesModel extends Decodable<SubjectPagesModel> {
  bool? status;
  String? message;
  List<Items>? items;
  List<String>? errors;

  SubjectPagesModel({this.status, this.message, this.items, this.errors});

  SubjectPagesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    errors = json['errors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['errors'] = this.errors;
    return data;
  }

  @override
  SubjectPagesModel decode(json) {
    status = json['status'];
    message = json['message'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    errors = json['errors'].cast<String>();
    return this;
  }
}

class Items {
  int? id;
  String? title;
  String? image;
  int? subjectId;
  int? pageNo;
  bool? isExplain;
  String? explainUrl;
  int? countQuestions;
  List<String>? videos;

  Items(
      {this.id,
      this.title,
      this.image,
      this.subjectId,
      this.pageNo,
      this.isExplain,
      this.explainUrl,
      this.countQuestions,
      this.videos});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    subjectId = json['subject_id'];
    pageNo = json['page_no'];
    isExplain = json['is_explain'];
    explainUrl = json['explain_url'];
    countQuestions = json['count_questions'];
    videos = json['videos'].cast<String>();
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
    data['videos'] = this.videos;
    return data;
  }
}
