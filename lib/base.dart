import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseViewModel<T extends BaseNavigator> extends ChangeNotifier {
  T? navigator = null;
}

abstract class BaseNavigator {
  void showLoding({String message});

  void hidenDialog();

  void ShowMassage(String message);
}

abstract class BaseView<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator {
  late VM ViewModel;

  VM initViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel = initViewModel();
  }

  @override
  void showLoding({String message = "Loding...."}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Loading...'),
                  CircularProgressIndicator(),
                ]),
          ),
        );
      },
    );
  }

  @override
  void ShowMassage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
        );
      },
    );
  }

  @override
  void hidenDialog() {
    Navigator.pop(context);
  }
}
