
import 'package:shater/core/network/decodable.dart';


class EmptyModel extends Decodable<EmptyModel> {
    String? message;

    EmptyModel({this.message});
  @override
  EmptyModel decode(data) {
    message = data['message'];
    return this;
  }
}
