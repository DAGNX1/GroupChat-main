import 'package:armando/Provider/user_provider.dart';
import 'package:armando/base.dart';
import 'package:armando/models/my_user.dart';
import 'package:armando/modules/CeateAccount/CreatAccountView.dart';
import 'package:armando/modules/Home/home_view.dart';
import 'package:armando/modules/Login/LoginNavigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../CeateAccount/Button_animate.dart';
import 'LoginViewModel.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseView<LoginScreen, LoginViewModel>
    implements LoginNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ViewModel.navigator = this;
  }

  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                centerTitle: true,
                title: Text(
                  'Create Account',
                  style: TextStyle(color: Colors.black),
                )),
            body: Padding(
              padding: const EdgeInsets.all(22),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == '' || value == null) {
                          return 'Please enter your email ';
                        }
                        // const String email = "tony@starkindustries.com"
                        final bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'Please enter valid email ';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text(' Email'),
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
                      height: 12,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value == '' && value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        label: Text('Password'),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                    ),
                    SizedBox(
                      height: 12,
                    ),
                    MinimalisticButton(
                      onTap: () {
                        print('_________');
                        validateFormButton();
                      },
                      text: 'Create Account',
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.lightBlueAccent,
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, CreateAccountScreen.routeName);
                        },
                        child: Text('I dont have an account '))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void validateFormButton() {
    if (formKey.currentState?.validate() == true) {
      ViewModel.Login(emailController.text, passwordController.text);
    }
  }

  @override
  LoginViewModel initViewModel() {
    return LoginViewModel();
  }

  @override
  goToHome(MyUser myUser) {
    var provider=Provider.of<UserProvider>(context,listen: false);
    provider.myUser=myUser;
   Navigator.pushReplacementNamed(context, HomeViewScreen.routeName);
  }
}
