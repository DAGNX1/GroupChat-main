import 'package:armando/Provider/user_provider.dart';
import 'package:armando/base.dart';
import 'package:armando/models/message.dart';
import 'package:armando/models/room.dart';
import 'package:armando/modules/chat/chat_navigator.dart';
import 'package:armando/modules/chat/chat_screen_viewModel.dart';
import 'package:armando/modules/chat/message_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
  static const String routeName = 'ChatScreen';
}

class _ChatScreenState extends BaseView<ChatScreen, ChatViewModel>
    implements ChatNavigator {
  var contentMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var room = ModalRoute.of(context)!.settings.arguments as Room;
    var provider = Provider.of<UserProvider>(context);
    ViewModel.myUser = provider.myUser!;
    ViewModel.room = room;
    ViewModel.getMessage();
    @override
    void initState() {
      // TODO: implement initState
      ViewModel.navigator = this;
    }

    return ChangeNotifierProvider(
      create: (context) => ViewModel,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/backgroundcreat.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                // leading: Image.asset(room?.roomImage??'assets/images/people.png'),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(room.roomName),
                      Text(room.roomDescribtion)
                    ]),
              ),
              body: Container(
                child: Column(children: [
                  Expanded(
                      child: StreamBuilder<QuerySnapshot<Message>>(
                    stream: ViewModel.getMessage(),
                    builder: (context, snapshot) {
                      var messages = snapshot.data?.docs.map((e) => e.data()).toList();
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return MessageWidget(messages![index]);
                        },
                        itemCount: messages?.length ?? 0,
                      );
                    },
                  )),
                  Container(
                    color: Color.fromRGBO(234, 238, 239, 1),
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(),
                          child: TextFormField(
                            controller: contentMessageController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                hintText: 'Type a message'),
                          ),
                        )),
                        SizedBox(width: 14),
                        Icon(Icons.attachment_outlined,
                            color: Colors.grey, size: 25),
                        SizedBox(width: 14),
                        Icon(Icons.mic_outlined, color: Colors.grey, size: 25),
                        SizedBox(width: 20),
                        InkWell(
                          onTap: () {
                            if (contentMessageController.text != ""){
                              ViewModel.sendMessage(
                                  contentMessageController.text);
                              contentMessageController.clear();
                            }
                          },
                          child: Icon(Icons.send_outlined,
                              size: 30,
                              color: Color.fromRGBO(128, 223, 255, 10)),
                        ),
                        SizedBox(width: 14),
                      ],
                    ),
                  )
                ]),
              )),
        ],
      ),
    );
  }

  @override
  ChatViewModel initViewModel() => ChatViewModel();
}
