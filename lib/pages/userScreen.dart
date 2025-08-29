import 'package:recriacao_devoraquiz/auth/auth_page.dart';
import 'package:recriacao_devoraquiz/pages/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recriacao_devoraquiz/pages/homepage.dart';
import 'package:recriacao_devoraquiz/provider/google_sign_in.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return UserInfos();
            } else if (snapshot.hasError) {
              return Center(child: Text('Algo deu errado'));
            } else {
              return AuthPage();
            }
          },
        ),
      );
}

class UserInfos extends StatefulWidget {
  const UserInfos({Key? key}) : super(key: key);

  @override
  _UserInfosState createState() => _UserInfosState();
}

class _UserInfosState extends State<UserInfos> {
  // Strings
  dynamic profileText = "Bem-Vindo!";
  dynamic nextButtonText = "Continuar";
  dynamic logoutButtonText = "Sair";

  // Colors and Decorations:
  // Body
  dynamic bodyColor = Colors.lightBlueAccent;

  // Profile
  dynamic profileTextColor = Colors.white;
  dynamic profileTextSize = 40.0;

  // User text
  dynamic userTextColor = Colors.white;
  dynamic userTextSize = 30.0;

  // Circle Avatar
  dynamic circleAvatarRadius = 40.0;

  // Next Button
  dynamic colorBGNextButton = Colors.white;
  dynamic colorTextNextButton = Colors.black;
  dynamic colorNextButtonIcon = Colors.lightBlueAccent;
  dynamic textNextButtonSize = 19.0;
  dynamic buttonNextPadding = EdgeInsets.all(40.0);

  // Logout Button
  dynamic colorBGLogoutButton = Colors.white;
  dynamic colorTextLogoutButton = Colors.black;
  dynamic colorLogoutButtonIcon = Colors.red;
  dynamic textLogoutButtonSize = 19.0;
  dynamic buttonLogoutPadding =
      EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: bodyColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              profileText,
              style: TextStyle(
                color: profileTextColor,
                fontWeight: FontWeight.bold,
                fontSize: profileTextSize,
              ),
            ),
            SizedBox(height: 25.0),
            CircleAvatar(
              radius: circleAvatarRadius,
              //* backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 15.0),
            //Text(
            //  user.displayName!,
            //  style: TextStyle(
            //    color: userTextColor,
            //    fontSize: userTextSize,
            //  ),
            //),
            SizedBox(height: 15.0),
            Padding(
              padding: buttonNextPadding,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: colorBGNextButton,
                  onPrimary: colorTextNextButton,
                  minimumSize: Size(double.infinity, 70),
                ),
                icon: FaIcon(FontAwesomeIcons.arrowAltCircleRight,
                    color: colorNextButtonIcon),
                label: Text(
                  nextButtonText,
                  style: TextStyle(
                    fontSize: textNextButtonSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
              ),
            ),
            Padding(
              padding: buttonLogoutPadding,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: colorBGLogoutButton,
                  onPrimary: colorTextLogoutButton,
                  minimumSize: Size(double.infinity, 70),
                ),
                icon: FaIcon(FontAwesomeIcons.signOutAlt,
                    color: colorLogoutButtonIcon),
                label: Text(
                  logoutButtonText,
                  style: TextStyle(
                    fontSize: textLogoutButtonSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
