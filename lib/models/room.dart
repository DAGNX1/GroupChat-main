class Room {
  static String CollctionName='Room';
  String id;
  String roomName;
  String roomDescribtion;
  String roomImage;

  Room(
      {this.id = '',
      required this.roomName,
      required this.roomDescribtion,
      required this.roomImage,
      });

  Room.fromJson(Map<String, dynamic> Json)
      : this(
          id: Json["id"],
          roomName: Json["roomName"],
          roomDescribtion: Json["roomDescribtion"],
          roomImage: Json["roomImage"],
        );

  Map<String, dynamic> toJson()  {
    return {
      "id": id,
      "roomName": roomName,
      "roomDescribtion": roomDescribtion,
      "roomImage": roomImage
    };
  }
}
