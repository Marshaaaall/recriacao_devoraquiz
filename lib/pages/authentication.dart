import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recriacao_devoraquiz/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class Authentication extends StatelessWidget {
  // Strings
  dynamic title = "Authentication Page";

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: Auth(),
      );
}

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  //Strings
  dynamic title = "Entre com sua conta Google";
  dynamic buttonText = 'Sign Up with Google';

  // Colors and Decorations
  dynamic colorTheme = Colors.lightBlueAccent;
  dynamic colorTitle = Colors.white;
  dynamic colorBGButton = Colors.white;
  dynamic colorTextButton = Colors.black;
  dynamic colorGoogleIcon = Colors.redAccent;
  dynamic titleSize = 25.0;
  dynamic titlePadding = EdgeInsets.only(top: 10.0);
  dynamic buttonPadding = EdgeInsets.all(50.0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
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
                      Text(
                        title,
                        style: TextStyle(
                          color: colorTitle,
                          fontSize: titleSize,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Padding(
                        padding: titlePadding,
                      ),
                      Padding(
                        padding: buttonPadding,
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            primary: colorBGButton,
                            onPrimary: colorTextButton,
                            minimumSize: Size(double.infinity, 50),
                          ),
                          icon: FaIcon(FontAwesomeIcons.google,
                              color: colorGoogleIcon),
                          label: Text(
                            buttonText,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            final provider = Provider.of<GoogleSignInProvider>(
                              context,
                              listen: false,
                            );

                            provider.googleLogin();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
