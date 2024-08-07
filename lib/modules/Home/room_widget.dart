import 'dart:io';

import 'package:armando/models/message.dart';
import 'package:armando/modules/chat/chat_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/room.dart';
import 'OpenImageDetails.dart';

class RoomWidget extends StatelessWidget {
  Room room;

  RoomWidget(this.room,);

  @override
  Widget build(BuildContext context) {
    File file = File(room.roomImage);


    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, ChatScreen.routeName,arguments: room);
          },
          child: Container(
            height: 100,
            decoration: BoxDecoration(
                color: Color.fromRGBO(222, 244, 249, 50),
                borderRadius: BorderRadius.circular(16)),
            child: Container(
              padding: EdgeInsets.only(left:85),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 22,
                    ),
                    Text(room.roomName.trim(),
                        style:
                            TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(room.roomDescribtion),
                  ],
                ),
            ),

          ),
        ),
        InkWell(
          onTap: () {

          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 18, bottom: 18, right: 10, left: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: CupertinoColors.secondaryLabel),
                  width: 60,
                  height: 60,
                  child: Image.file(file)),
            ),
          ),
        ),
      ],
    );
  }
}
