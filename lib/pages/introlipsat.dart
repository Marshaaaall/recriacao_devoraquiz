// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:recriacao_devoraquiz/pages/questionsLipSat.dart';
import 'package:recriacao_devoraquiz/pages/quizzes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroLipSat extends StatefulWidget {
  const IntroLipSat({Key? key}) : super(key: key);

  @override
  State<IntroLipSat> createState() => _IntroLipSatState();
}

class _IntroLipSatState extends State<IntroLipSat> {
  Start() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => lipsat_screen()),
    );
  }

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Devora Quiz"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Lipídios Saturados Quiz",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.teko(
                          color: Color.fromARGB(255, 81, 187, 136),
                          fontSize: 47,
                        ),
                      )
                    ],
                  ),
                ),
                Image.network(
                  "https://www.dino.com.br/DinoImages/081f582b-3f86-4b07-ad03-e479cd052637.png?quality=100&width=620",
                  fit: BoxFit.cover,
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 20),
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
                              'https://docs.google.com/uc?export=download&id=1EhOBOXBeR7VZFSDX6Mh0X4-2rIPCVFLY');
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.topic_outlined),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Relacionado a - ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "Lipídios, Saturados, Alimentação, Gordura, Saúde",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.query_builder_outlined),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Duração -",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "X minutos",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.description_outlined),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "Descrição - ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        "Presentes na gordura saturada, a qual se apresenta em forma sólida ou semi-sólida a temperatura ambiente. Está presente sobretudo em produtos de origem animal, mas também pode ser encontrado em alguns produtos vegetais. Existe uma grande variedade de ácidos graxos saturados, mas segundo a Sociedade Brasileira de Cardiologia, os que influenciam os níveis de colesterol são os de cadeia longa (acima de 14 átomos de carbono na cadeia).",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                //* start button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: Start,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'COMEÇAR',
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
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
