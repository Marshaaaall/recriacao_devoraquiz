import 'package:flutter/material.dart';
import 'package:recriacao_devoraquiz/auth/auth_page.dart';
import 'package:recriacao_devoraquiz/auth/main_page.dart';
import 'package:recriacao_devoraquiz/pages/HomePage.dart';
import 'package:recriacao_devoraquiz/pages/loginScreen.dart';
import 'package:recriacao_devoraquiz/pages/quizzes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:recriacao_devoraquiz/pages/splashScreen.dart';
import 'package:recriacao_devoraquiz/provider/google_sign_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: Color.fromARGB(255, 81, 187, 136),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color.fromARGB(255, 81, 187, 136),
              secondary: Colors.greenAccent,
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      );
}
