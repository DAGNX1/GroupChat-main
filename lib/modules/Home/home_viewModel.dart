import 'package:armando/base.dart';
import 'package:armando/database/database_utils.dart';
import 'package:armando/models/message.dart';
import 'package:armando/modules/Home/home_navigator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/room.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  List<Room> rooms = [];
 late Room room;

  HomeViewModel() {
    getRooms();
  }
@override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();

  }
  void getRooms() async {
    try {
      DataBaseUtils.getRoomFromFireStore().then((room) {
        rooms = room;
      });
    } catch (e) {
      navigator!.ShowMassage(e.toString());
    }
  }

}
