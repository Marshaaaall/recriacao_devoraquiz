import 'package:flutter/material.dart';
import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recriacao_devoraquiz/pages/homepage.dart';
import 'package:recriacao_devoraquiz/auth/main_page.dart';
import 'package:recriacao_devoraquiz/pages/userScreen.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// SplashScreen class
class _SplashScreenState extends State<SplashScreen> {
  // Strings
  dynamic title = "Devora Quiz";
  dynamic progressString = "Carregando...";

  // "Objects"
  dynamic progressBar = CircularProgressIndicator();
  dynamic splashDurationSeconds = 2;

  // Colors and Decorations
  dynamic colorTheme = Colors.greenAccent;
  dynamic colorAvatar = Colors.white;
  dynamic colorIcon = Colors.green;
  dynamic colorTitle = Colors.white;
  dynamic colorProgressString = Colors.white;
  dynamic circlePadding = EdgeInsets.only(top: 10.0);
  dynamic progressPadding = EdgeInsets.only(top: 20.0);
  dynamic titleSize = 45.0;
  dynamic progressStringSize = 25.0;

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: splashDurationSeconds),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: colorTheme),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: colorAvatar,
                        radius: 50.0,
                        child: Icon(
                          FontAwesomeIcons.seedling,
                          color: colorIcon,
                          size: 35.0,
                        ),
                      ),
                      Padding(
                        padding: circlePadding,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: colorTitle,
                          fontSize: titleSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    progressBar,
                    Padding(
                      padding: progressPadding,
                    ),
                    Text(
                      progressString,
                      style: TextStyle(
                        color: colorProgressString,
                        fontSize: progressStringSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
