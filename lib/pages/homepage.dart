// ignore_for_file: prefer_const_constructors

import 'package:recriacao_devoraquiz/pages/introdcnt.dart';
import 'package:recriacao_devoraquiz/pages/quizzes.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recriacao_devoraquiz/widgets/sidenavbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StartDCNT() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IntroDCNT()),
    );
  }

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Devora Quiz",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: SideNav(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // *hello again!
                SizedBox(height: 40),
                Text(
                  'SEJA BEM-VINDO',
                  style: GoogleFonts.teko(
                    color: Color.fromARGB(255, 81, 187, 136),
                    fontSize: 52,
                  ),
                ),
                Text(
                  'AO DEVORA QUIZ!',
                  style: GoogleFonts.teko(
                    color: Color.fromARGB(255, 81, 187, 136),
                    fontSize: 52,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 35,
                    child: IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.headphones,
                      ),
                      iconSize: 40,
                      onPressed: () async {
                        if (isPlaying) {
                          await audioPlayer.pause();
                        } else {
                          await audioPlayer.play(
                              'https://docs.google.com/uc?export=download&id=1iGzMmtByJmfsWGSWd_UlNMRMBIg8Rmdu');
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Neste jogo você responderá várias perguntas relacionadas a alimentação. Elas estão separadas em três grupos: carboidratos, gorduras saturadas e insaturadas. Não se preocupe em responder tudo certo, pois não há como perder neste jogo. Ao final, você verá os acertos e erros e receberá dicas sobre como ter uma alimentação mais equilibrada.\n\nDIVIRTA-SE!',
                    style: GoogleFonts.teko(
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(height: 40),

                //* start button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: StartDCNT,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'CONTINUAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
