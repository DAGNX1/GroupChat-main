class Message {
  static String CollctionName='Message';
  String id;
  String content;
  int dateTime;
  String senderName;
  String senderId;
  String roomId;

  Message({this.id = '',
    required this.content,
    required this.dateTime,
    required this.senderName,
    required this.senderId,
    required this.roomId});

  Message.fromJson(Map<String, dynamic>json) :this(
    content: json['content'],
    id: json['id'],
    dateTime: json['dateTime'],
    senderName: json['senderName'],
    senderId: json['senderId'],
    roomId: json['roomId'],
  );

  Map<String, dynamic> toJson(){
    return {
      "id": id,
      "content": content,
      "dateTime": dateTime,
      "senderName": senderName,
      "senderId": senderId,
      "roomId": roomId,


    };
  }

}
