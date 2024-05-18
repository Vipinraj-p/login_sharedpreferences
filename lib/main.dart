import 'package:flutter/material.dart';
import 'package:login_sharedpreferences/splash_screen.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';
const USER_NAME = 'UserName';
const PASSWORD = 'Password';
void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false, home: SpalashScreen()));
}
