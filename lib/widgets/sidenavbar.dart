// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_declarations, unused_local_variable, avoid_unnecessary_containers, prefer_const_constructors

import 'package:recriacao_devoraquiz/auth/main_page.dart';
import 'package:recriacao_devoraquiz/pages/homepage.dart';
import 'package:recriacao_devoraquiz/pages/introcarbo.dart';
import 'package:recriacao_devoraquiz/pages/introdcnt.dart';
import 'package:recriacao_devoraquiz/pages/introlipins.dart';
import 'package:recriacao_devoraquiz/pages/introlipsat.dart';
import 'package:recriacao_devoraquiz/pages/logout.dart';
import 'package:recriacao_devoraquiz/pages/questionsCarbs.dart';
import 'package:recriacao_devoraquiz/pages/questionsLipIns.dart';
import 'package:recriacao_devoraquiz/pages/questionsLipSat.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SideNav extends StatefulWidget {
  const SideNav({Key? key}) : super(key: key);

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  final user = FirebaseAuth.instance.currentUser;

  Future<String> signOut() async {
    FirebaseAuth.instance.signOut();
    return "Deslogado com sucesso!";
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color.fromARGB(255, 81, 187, 136),
        child: ListView(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Column(
                      children: [
                        Text(
                          'Nome aqui',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Pontos aqui",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
                    )
                  ],
                )),
            listItem(
              context: context,
              path: MaterialPageRoute(
                  builder: (BuildContext context) => IntroDCNT()),
              label: "DCNT's Quiz",
              icon: Icons.content_paste_search_rounded,
            ),
            listItem(
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => IntroCarbo()),
                label: "Carboidatros Quiz",
                icon: Icons.content_paste_search_rounded),
            listItem(
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => IntroLipIns()),
                label: "Lipídios Insaturados Quiz",
                icon: Icons.content_paste_search_rounded),
            listItem(
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => IntroLipSat()),
                label: "Lipídios Saturados Quiz",
                icon: Icons.content_paste_search_rounded),
            listItem(
              context: context,
              path: MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()),
              label: "Sobre nós",
              icon: Icons.business_rounded,
            ),
            listItem(
              context: context,
              path: MaterialPageRoute(
                  builder: (BuildContext context) => logout()),
              label: "Deslogar",
              icon: Icons.logout_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem({
    required String label,
    required IconData icon,
    required BuildContext context,
    required MaterialPageRoute path,
  }) {
    final color = Colors.white;
    final hovercolor = Colors.white60;

    return ListTile(
        leading: Icon(
          icon,
          color: color,
        ),
        hoverColor: hovercolor,
        title: Text(label, style: TextStyle(color: color)),
        onTap: () async {
          Navigator.pushReplacement(context, path);
        });
  }
}
