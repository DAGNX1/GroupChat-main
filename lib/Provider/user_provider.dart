import 'package:armando/database/database_utils.dart';
import 'package:armando/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  MyUser? myUser;
  User? userAuth;

  UserProvider(){
    userAuth=FirebaseAuth.instance.currentUser;
    initMyUser();
  }
  void initMyUser() async {
    if (userAuth != null) {
      myUser = await DataBaseUtils.ReadUserToFirestore(userAuth!.uid);
      print('zzzzzzzzzzzzzzzzzzzzzzzz');
    }


  }
}
