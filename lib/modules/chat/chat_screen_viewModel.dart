import 'package:armando/base.dart';
import 'package:armando/database/database_utils.dart';
import 'package:armando/models/message.dart';
import 'package:armando/models/my_user.dart';
import 'package:armando/models/room.dart';
import 'package:armando/modules/chat/chat_navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatViewModel extends BaseViewModel<ChatNavigator> {
  late MyUser myUser;
  late Room room;
  void sendMessage(String content) {
    Message message = Message(
        content: content,
        dateTime: DateTime.now().millisecondsSinceEpoch,
        senderName: myUser.userName,
        senderId: myUser.id,
        roomId: room.id);
    DataBaseUtils.addMessageTOFireStore(message);
  }

  Stream<QuerySnapshot<Message>> getMessage(){
   return DataBaseUtils.getMessageFromFireStore(room.id);

  }
}
