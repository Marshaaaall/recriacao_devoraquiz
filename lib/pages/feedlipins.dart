// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:recriacao_devoraquiz/pages/homepage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recriacao_devoraquiz/widgets/sidenavbar.dart';

class FeedbackLipIns extends StatelessWidget {
  final String userId;
  FeedbackLipIns(this.userId);
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

          if (data['scorelipins'] >= 6) {
            audioLink =
                'https://docs.google.com/uc?export=download&id=1jHzxuZr4B5KwukXstLX0Cy2kxc9TM2y7';
            resultText =
                'Parabéns, você sabe direitinho quem são e em que quantidade essas primas do bem estão na nossa alimentação cotidiana. Continue a se informar e se alimentar de forma equilibrada e saudável!';
          } else if (data['scorelipins'] >= 3) {
            audioLink =
                'https://docs.google.com/uc?export=download&id=13BDU57gEfUiKkkcOdIOFT8gXy-2neO7K';
            resultText =
                'Fantástico, você sabe localizar onde estão essas “primas do bem”, mas em alguns momentos não é tão fácil de saber as quantidades, não é mesmo? Entretanto, isso é o de menos, o que realmente importa é que agora você já sabe que essas heroínas do nosso organismo estão em nozes, castanhas, azeites, abacates, peixes etc. Continue aperfeiçoando  seu radar e equilibrando sua alimentação!';
          } else {
            audioLink =
                'https://docs.google.com/uc?export=download&id=1Q7IDLV5qg1kGXYZLOAYi327WZQnvn5VM';
            resultText =
                'Hmm, Acho que você não sabe muito bem onde estão essas “primas do bem” nos exemplos, né? Mas, tudo bem. O que realmente importa é que agora você já sabe que essas heroínas do nosso organismo estão em nozes, castanhas, azeites, abacates, peixes etc. Continue aperfeiçoando seu radar e equilibrando sua alimentação!';
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
                        'LIPÍDIOS INSATURADOS',
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
