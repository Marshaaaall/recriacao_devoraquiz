import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recriacao_devoraquiz/auth/main_page.dart';
import 'package:recriacao_devoraquiz/questionscarbo/carbo1.dart';

class logout extends StatelessWidget {
  const logout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.signOut();
    return Scaffold(
      body: MainPage(), // ignore: prefer_const_constructors
    );
  }
}
