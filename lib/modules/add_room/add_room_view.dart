import 'dart:io';
import 'package:armando/base.dart';
import 'package:armando/modules/Home/home_view.dart';
import 'package:armando/modules/add_room/add_room_viewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../CeateAccount/Button_animate.dart';
import 'add_room_navigator.dart';

class AddRoomScreen extends StatefulWidget {
  static const String routeName = 'AddRoomScreen';

  @override
  State<AddRoomScreen> createState() => _AddRoomScreenState();
}

var nameRoomController = TextEditingController();
var descriptionRoomController = TextEditingController();
var FormKey = GlobalKey<FormState>();

class _AddRoomScreenState extends BaseView<AddRoomScreen, AddRoomViewModel>
    implements AddRoomNavigator {
  var pathImage = 'assets/images/people.png';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModel,
      child: Stack(children: [
        Image.asset(
          'assets/images/backgroundcreat.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              decoration: BoxDecoration(),
              child: Card(
                color: Color.fromRGBO(255, 255, 255, 30),
                elevation: 16,
                margin:
                    EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 100),
                child: Scaffold(
                    backgroundColor: Colors.transparent,
                    resizeToAvoidBottomInset: false,
                    appBar: AppBar(
                        foregroundColor: Colors.lightBlueAccent,
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        centerTitle: true,
                        title: Text(
                          'Create New Group',
                          style: TextStyle(color: Colors.black),
                        )),
                    body: Padding(
                      padding: const EdgeInsets.all(22),
                      child: Form(
                        key: FormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                InkWell(
                                  onTap: () {
                                    pickImage();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: 130,
                                      height: 130,
                                      child: Stack(
                                        alignment: Alignment.bottomLeft,
                                        children: [
                                          image != null
                                              ? ClipRRect(
                                                  child: Image.file(
                                                    image!,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    fit: BoxFit.fill,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(80),
                                                )
                                              : Image.asset(pathImage),
                                          Icon(
                                            Icons.camera_alt,
                                            size: 35,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: nameRoomController,
                              validator: (value) {
                                if (value == '' || value == null) {
                                  return 'Please enter the group name';
                                }
                              },
                              decoration: InputDecoration(
                                label: Text(' group name '),
                                // hintText: 'First name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            TextFormField(
                              controller: descriptionRoomController,
                              validator: (value) {
                                if (value == '' && value!.isEmpty) {
                                  return 'Please enter group description';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                label: Text('Description'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            MinimalisticButton(
                              onTap: () {
                                print('_________');
                                validateFormButton();
                              },
                              text: 'Create ',
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            ),
            // Container(
            //     height: 202,
            //     width: double.infinity,
            //     color: Color.fromRGBO(158, 230, 255, 1)),
            // Container(
            //     height: MediaQuery.of(context).size.height * .030,
            //     width: double.infinity,
            //     color: Color.fromRGBO(79, 232, 141, 1)),
            // Container(
            //     height: MediaQuery.of(context).size.height * .020,
            //     width: double.infinity,
            //     color: Color.fromRGBO(175, 98, 53, 1)),
            // Container(
            //   width: MediaQuery.of(context).size.width * .400,
            //   height: MediaQuery.of(context).size.height * .18,
            //   child: Image.asset(
            //     'assets/images/flower.png',
            //     fit: BoxFit.cover,
            //     height: double.infinity,
            //     width: double.infinity,
            //   ),
            // ),
            // Positioned(
            //   right: MediaQuery.of(context).size.width * .080,
            //   bottom: MediaQuery.of(context).size.width * .290,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width * .400,
            //     height: MediaQuery.of(context).size.height * .18,
            //     child: Image.asset(
            //       'assets/images/cloudy.png',
            //       fit: BoxFit.cover,
            //       height: double.infinity,
            //       width: double.infinity,
            //     ),
            //   ),
            // ),
            // Positioned(
            //   right: MediaQuery.of(context).size.width * .070,
            //   bottom: MediaQuery.of(context).size.width * .00,
            //   child: Container(
            //     width: MediaQuery.of(context).size.width * .500,
            //     height: MediaQuery.of(context).size.height * .20,
            //     child: Image.asset(
            //       'assets/images/source.gif',
            //       fit: BoxFit.cover,
            //       height: double.infinity,
            //       width: double.infinity,
            //     ),
            //   ),
            // ),
          ],
        )
      ]),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.navigator = this;
  }

  @override
  AddRoomViewModel initViewModel() {
    return AddRoomViewModel();
  }

/////////////

  @override
  void RoomCreated() {
    CircularProgressIndicator();
    Navigator.pushReplacementNamed(context, HomeViewScreen.routeName);
  }

  File? image;

  Future pickImage() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      // final imageTemp = image.path;

      setState(() => this.image = File(image.path));
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }

  }

  void validateFormButton() {
    if (FormKey.currentState!.validate() != null) {
      ViewModel.CreateRoom(nameRoomController.text,
          descriptionRoomController.text, this.image?.path??'/data/user/0/com.example.armando/cache/image_picker8889273950077848459.jpg');
      print('${ this.image?.path}');
    }
  }
}
