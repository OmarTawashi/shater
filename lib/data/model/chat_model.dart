import 'package:shater/data/model/user.dart';

import 'message_model.dart';

class Chat {
  final String? id;
  final List<User>? users;
  final List<Message>? messages;

  const Chat({
    this.id,
    this.users = const <User>[],
    this.messages = const <Message>[],
  });

  Chat copyWith({
    String? id,
    List<User>? users,
    List<Message>? messages,
  }) {
    return Chat(
      id: id ?? this.id,
      users: users ?? this.users,
      messages: messages ?? this.messages,
    );
  }

  
}
