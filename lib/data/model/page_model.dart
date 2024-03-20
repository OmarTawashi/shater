import 'package:shater/core/network/decodable.dart';

class PageModel extends Decodable<PageModel>{
  int? fromPageNo;
  int? toPageNo;

  PageModel({this.fromPageNo, this.toPageNo});

  PageModel.fromJson(Map<String, dynamic> json) {
    fromPageNo = json['from_page_no'];
    toPageNo = json['to_page_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['from_page_no'] = this.fromPageNo;
    data['to_page_no'] = this.toPageNo;
    return data;
  }

  @override
  PageModel decode(json) {
    fromPageNo = json['from_page_no'];
    toPageNo = json['to_page_no'];
    return this;
  }
}
