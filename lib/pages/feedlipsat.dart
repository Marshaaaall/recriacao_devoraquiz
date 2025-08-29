// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recriacao_devoraquiz/pages/homepage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recriacao_devoraquiz/widgets/sidenavbar.dart';

class FeedbackLipSat extends StatelessWidget {
  final String userId;
  FeedbackLipSat(this.userId);
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    String resultText;
    String audioLink;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(userId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          if (data['scorelipsat'] >= 7) {
            audioLink =
                'https://docs.google.com/uc?export=download&id=1hVJH8QhS-0VFrIYj2hYJCcKDQ6lk4Ehy';
            resultText =
                'Uhulll. Parabéns, você acertou muitas questões e isso demonstra que você observa muito bem a localização destas gorduras na sua alimentação. Continue com seu radar ligado e fique de olho,  a OMS (Organização Mundial da Saúde) recomenda que uma dieta saudável tenha no máximo 10% de gorduras saturadas (o equivalente a 22,2 g por dia) e menos de 1% de gorduras trans (o equivalente a 2,2g).';
          } else if (data['scorelipsat'] >= 4) {
            audioLink =
                'https://docs.google.com/uc?export=download&id=1CF5fFEbDfHyEjqIS0ZpEqrhUCZvC9Za5';
            resultText =
                'Boaaaaa. Você acertou muitas questões e isso mostra que você já sabe identificar estas malandrinhas em sua alimentação. Mas, vejo que seu radar não captou todas elas, né? Não se preocupe,  o importante é continuar a buscar informações de qualidade sobre alimentação equilibrada. Para te ajudar, saiba que a OMS ( Organização Mundial da Saúde) recomenda que uma dieta saudável tenha no máximo 10% de gorduras saturadas (o equivalente a 22,2 g por dia) e menos de 1% de gorduras trans (o equivalente a 2,2g).';
          } else {
            audioLink =
                'https://docs.google.com/uc?export=download&id=1c4-XBhQL4J7tAbygpeYYDY3FkhkB5C8T';
            resultText =
                'Que pena. Seu resultado não foi tão bom né? Talvez seja porque essas gordurinhas sejam muito sorrateiras e nosso radar quase não consegue detectá-las em nossa avoada alimentação cotidiana. Mas, o mais importante é continuar a calibrar o radar para enxergar essas malandrinhas quando elas estiverem entre nós. Fique de olho, a OMS ( Organização Mundial da Saúde) recomenda que uma dieta saudável tenha no máximo 10% de gorduras saturadas (o equivalente a 22,2 g por dia) e menos de 1% de gorduras trans (o equivalente a 2,2g).';
          }

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
                        'LIPÍDIOS SATURADOS',
                        style: GoogleFonts.teko(
                          color: Color.fromARGB(255, 81, 187, 136),
                          fontSize: 52,
                        ),
                      ),
                      Text(
                        'RESULTADOS:',
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
                                await audioPlayer.play(audioLink);
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          resultText,
                          style: GoogleFonts.teko(
                            fontSize: 25,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 40),

                      //* back button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'VOLTAR',
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
        return Text("");
      },
    );
  }
}
