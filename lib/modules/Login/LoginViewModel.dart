import 'package:armando/base.dart';
import 'package:armando/database/database_utils.dart';
import 'package:armando/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'LoginNavigator.dart';

class LoginViewModel extends BaseViewModel<LoginNavigator> {

  void Login(String emailAddress, String password)async{
    try {
      navigator!.showLoding();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password,
      );
      navigator!.hidenDialog();
     MyUser? myUser= await DataBaseUtils.ReadUserToFirestore(credential.user?.uid??'');
      if(myUser!=null){
        navigator!.goToHome(myUser);
      }


    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        navigator!.hidenDialog();
        navigator!.ShowMassage('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        navigator!.hidenDialog();
        navigator!.ShowMassage('Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }

  }
}
