import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormFild {
  static TextFormField TextFormFildl(
      {var passwordController,
      bool obscureText = false,
      required String Text_in_Label}) {
    return TextFormField(
      controller: passwordController,
      obscureText: obscureText,
      validator: (value) {
        if (value == '' && value!.isEmpty) {
          return 'Please enter your password';

        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(Text_in_Label),
        hintText: Text_in_Label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
