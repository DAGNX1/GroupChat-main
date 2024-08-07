import 'package:armando/Provider/user_provider.dart';
import 'package:armando/modules/Home/home_view.dart';
import 'package:armando/modules/Login/LoginView.dart';
import 'package:armando/modules/chat/chat_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'modules/CeateAccount/CreatAccountView.dart';
import 'modules/add_room/add_room_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      create: (context) => UserProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Armando',
      initialRoute: provider.userAuth == null
          ? LoginScreen.routeName
          : HomeViewScreen.routeName,
      routes: {
        CreateAccountScreen.routeName: (context) => CreateAccountScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeViewScreen.routeName: (context) => HomeViewScreen(),
        AddRoomScreen.routeName: (context) => AddRoomScreen(),
        ChatScreen.routeName:(context) => ChatScreen(),
      },
    );
  }
}
