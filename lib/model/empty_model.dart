
import '../core/network/decodable.dart';

class EmptyModel extends Decodable<EmptyModel> {
  @override
  EmptyModel decode(data) {
    return this;
  }
}
