import 'package:armando/base.dart';
import 'package:armando/modules/Home/home_navigator.dart';
import 'package:armando/modules/Home/home_viewModel.dart';
import 'package:armando/modules/Home/room_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../add_room/add_room_view.dart';

class HomeViewScreen extends StatefulWidget {
  static const String routeName = 'HomeViewScreen';

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends BaseView<HomeViewScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.navigator = this;

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/backgroundcreat.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.lightBlueAccent,
                onPressed: () {
                  Navigator.pushNamed(context, AddRoomScreen.routeName);
                },
                child: Icon(Icons.add),
              ),
              backgroundColor: Colors.transparent,
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                leadingWidth: 50,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search, size: 40),
                    )
                  ],
                  leading: Icon(Icons.list, size: 40),
                  titleTextStyle: TextStyle(fontSize: 20),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  centerTitle: true,
                  title: Text(
                    'Group Chat',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
              body: Consumer<HomeViewModel>(
                builder: (_, homeViewModel, h) {
                  return ListView.separated(
                    separatorBuilder: (context, index){
                      return SizedBox(height: 20,);
                    },

                    padding: EdgeInsets.all(15),

                    itemBuilder: (context, index) {
                      return RoomWidget(homeViewModel.rooms[index]);
                    },
                    itemCount: homeViewModel.rooms.length,
                  );
                },
              )),
        ],
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}
