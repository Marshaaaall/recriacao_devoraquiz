import 'package:recriacao_devoraquiz/pages/loginScreen.dart';
import 'package:recriacao_devoraquiz/pages/signupScreen.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //* showing login screen
  bool showLoginScreen = true;

  void toggleScreens() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(showSignupScreen: toggleScreens);
    } else {
      return SignupScreen(
        showLoginScreen: toggleScreens,
      );
    }
  }
}
