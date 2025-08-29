// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recriacao_devoraquiz/pages/homepage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recriacao_devoraquiz/widgets/sidenavbar.dart';

class FeedbackCarb extends StatelessWidget {
  final String userId;
  FeedbackCarb(this.userId);
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

          if (data['scorecarb'] >= 8) {
            audioLink =
                'https://docs.google.com/uc?export=download&id=10FFWwfLkx2gK8kDNt5GCVtRP5sfBjA08';
            resultText =
                'Uhuullllllll Parabéns, você acertou muitas perguntas! Parece que você sabe bem em que lugares os açúcares estão escondidos e percebeu que podem se disfarçar em muitos alimentos. Continue assim e se informe sempre para manter sua alimentação equilibrada. De acordo com a recomendação da Organização Mundial da Saúde (OMS), uma dieta saudável tem até 10% de carboidratos, o equivalente a 50 g por dia.';
          } else if (data['scorecarb'] >= 4) {
            audioLink =
                'https://docs.google.com/uc?export=download&id=1FWe1nP0feBUmOGK4JHyzpU6UC9oxZbjy';
            resultText =
                'Que legal!!!! Você acertou muitas questões e isso significa que você já consegue reconhecer boa parte dos açúcares e em que alimentos estão escondidos. Mas, ainda tem  alguns que passam despercebidos, né? Fique atento e se informe sempre! Para te ajudar, a Organização Mundial da Saúde (OMS) recomenda que uma dieta saudável tenha no máximo 10% de carboidratos, o equivalente a 50 g por dia.';
          } else {
            audioLink =
                'https://docs.google.com/uc?export=download&id=1LTKyspz3WNuyqopTxbptya1LkrTAIosG';
            resultText =
                'Ah, que pena. Seu resultado não foi tão bom, né. Talvez as questões tenham ficado confusas ou você pode ter se surpreendido com a quantidade de açúcar que está escondida na sua alimentação. Mas, o importante é se informar sempre e tentar equilibrar o que você come. Para te ajudar, a Organização Mundial da Saúde (OMS) recomenda que uma dieta saudável tenha no máximo 10% de carboidratos, o equivalente a 50 g por dia.';
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
                        'CARBOIDRATOS',
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
