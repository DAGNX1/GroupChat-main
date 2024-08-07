import 'package:armando/base.dart';
import 'package:armando/database/database_utils.dart';
import 'package:armando/models/my_user.dart';
import 'package:armando/modules/CeateAccount/CreateAccountNavigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CreateAccountViewModel extends BaseViewModel<CreateAccountNavigator> {
  void CreatAccountButton(String fName, String lName, String userName,
      String emailAddress, String password) async {
    try {
      navigator!.showLoding();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      MyUser myUser = MyUser(
          id: credential.user!.uid,
          fName: fName,
          lName: lName,
          userName: userName,
          email: emailAddress);
      DataBaseUtils.AddUserToFirestore(myUser);
      //adduser
      // navigator!.hidenDialog();
      navigator!.goTOHome(myUser);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        navigator!.hidenDialog();
        navigator!.ShowMassage('The password provided is too weak.');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        navigator!.hidenDialog();
        navigator!.ShowMassage('The account already exists for that email..');
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    SizedBox(
      height: 12,
    );
  }
}
