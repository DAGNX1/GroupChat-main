import 'package:armando/Provider/user_provider.dart';
import 'package:armando/models/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MessageWidget extends StatelessWidget {
  Message message;

  MessageWidget(this.message);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return provider.myUser!.id == message.senderId
        ? SenderMessage(message)
        : ReciverMessage(message);
  }
}

class SenderMessage extends StatelessWidget {
  Message message;

  SenderMessage(this.message);
  @override
  Widget build(BuildContext context) {
    int ts = message.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);
    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    print(date);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical:12,horizontal:28 ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16) ,topRight: Radius.circular(16) ),
                      color: Color.fromRGBO(235, 235, 235, 10)),
                  child: Text(message.content,)),
              SizedBox(height: 3),
              Text(date.substring(12),style: TextStyle(fontSize: 8),),


            ]),
      ),
    );
  }


}

class ReciverMessage extends StatelessWidget {
  Message message;

  ReciverMessage(this.message);
  @override
  Widget build(BuildContext context) {
    int ts = message.dateTime;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);
    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    print(date);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  padding: EdgeInsets.symmetric(vertical:12,horizontal:28 ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16) ,topLeft: Radius.circular(16) ),
                      color: Color.fromRGBO(235, 235, 235, 10)),
                  child: Text(message.content)),
              SizedBox(height: 3),
              Text(date.substring(12)),
            ]),
      ),
    );
  }


}
