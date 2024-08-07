import 'package:armando/models/message.dart';
import 'package:armando/models/my_user.dart';
import 'package:armando/models/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseUtils {
  static CollectionReference<MyUser> getUserCollction() {
    return FirebaseFirestore.instance
        .collection(MyUser.CollctionName)
        .withConverter<MyUser>(
            fromFirestore: (snapshot, options) =>
                MyUser.fromJson(snapshot.data()!),
            toFirestore: (value, options) => value.toJson());
  }

  static Future<void> AddUserToFirestore(MyUser myUser) {
    return getUserCollction().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> ReadUserToFirestore(String id) async {
    var userRefrence = await getUserCollction().doc(id).get();
    return userRefrence.data();
  }

/////////////////////////////////Room///////////////////////////////////

  static CollectionReference<Room> getRoomCollction() {
    return FirebaseFirestore.instance
        .collection(Room.CollctionName)
        .withConverter<Room>(
          fromFirestore: (snapshot, options) => Room.fromJson(snapshot.data()!),
          toFirestore: (Room, options) => Room.toJson(),
        );
  }

  static Future<void> AddRoomTOFireStore(Room room) {
    var docRef = getRoomCollction().doc();
    room.id = docRef.id;
    return docRef.set(room);
  }

  static Future<List<Room>> getRoomFromFireStore() async {
    var snapShotRooms = await getRoomCollction().get();
    List<Room> rooms = snapShotRooms.docs.map((doc) => doc.data()).toList();
    return rooms;
  }

  ////////////////////////////////Messages //////////////////////////////

  static CollectionReference<Message> getMessageCollction(String roomId) {
    return getRoomCollction()
        .doc(roomId)
        .collection(Message.CollctionName)
        .withConverter<Message>(
          fromFirestore: (snapshot, options) =>
              Message.fromJson(snapshot.data()!),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  static Future<void> addMessageTOFireStore(Message message) async {
    var docRef = getMessageCollction(message.roomId).doc();
    message.id = docRef.id;
    return docRef.set(message);
  }

  static Stream<QuerySnapshot<Message>> getMessageFromFireStore(String roomID) {
    return getMessageCollction(roomID).orderBy('dateTime').snapshots();
  }
}
