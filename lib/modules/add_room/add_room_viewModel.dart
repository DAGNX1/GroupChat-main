import 'package:armando/base.dart';
import 'package:armando/database/database_utils.dart';
import 'package:armando/models/room.dart';
import 'package:flutter/material.dart';
import 'add_room_navigator.dart';

 class AddRoomViewModel extends BaseViewModel<AddRoomNavigator> {
   @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }
   void CreateRoom(String roomName, String roomDescribtion, String roomImage) {
    Room room = Room(
        roomName: roomName,
        roomDescribtion: roomDescribtion,
        roomImage: roomImage);
    DataBaseUtils.AddRoomTOFireStore(room).then((value) {
      CircularProgressIndicator();
      navigator?.RoomCreated();
    }).catchError((error) {
      navigator!.ShowMassage(error.toString());
    });
  }
}
