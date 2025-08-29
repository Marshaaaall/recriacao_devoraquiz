// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:recriacao_devoraquiz/pages/questionsLipIns.dart';
import 'package:recriacao_devoraquiz/pages/quizzes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroLipIns extends StatefulWidget {
  const IntroLipIns({Key? key}) : super(key: key);

  @override
  State<IntroLipIns> createState() => _IntroLipInsState();
}

class _IntroLipInsState extends State<IntroLipIns> {
  Start() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => lipins_screen()),
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
                        "Lipídios Insaturados Quiz",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.teko(
                          color: Color.fromARGB(255, 81, 187, 136),
                          fontSize: 43,
                        ),
                      )
                    ],
                  ),
                ),
                Image.network(
                  "https://saude.abril.com.br/wp-content/uploads/2018/09/gordura-insaturada.png?quality=85&strip=info&resize=850,567",
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
                              'https://docs.google.com/uc?export=download&id=1t-kRIDmKqrhpYy0q7haULluHHgmedrU8');
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
                        "Lipídios, Insaturados, Alimentação, Gordura, Saúde",
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
                        "Agora vamos falar de uma prima das gorduras saturadas: as gorduras insaturadas e poli-insaturadas.Este tipo de lipídio nos traz muitos benefícios e são as gorduras melhor aceitas pelo nosso organismo. Estão presentes em alimentos como abacate, castanhas, amendoim, azeite de oliva e alguns peixes. Mas, não se engane, não é porque faz bem que devemos exagerar!",
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
