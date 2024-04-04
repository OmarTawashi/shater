import 'package:shater/data/model/user.dart';

class Chat {
  final String? id;
  final List<User>? users;

  const Chat({
    this.id,
    this.users = const <User>[],
  });

  Chat copyWith({
    String? id,
    List<User>? users,
  }) {
    return Chat(
      id: id ?? this.id,
      users: users ?? this.users,
    );
  }
}
