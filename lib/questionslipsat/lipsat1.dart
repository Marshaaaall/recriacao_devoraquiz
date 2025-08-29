// ignore_for_file: prefer_const_constructors
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recriacao_devoraquiz/questionscarbo/carbo2.dart';
import 'package:recriacao_devoraquiz/questionslipsat/lipsat2.dart';
import 'package:recriacao_devoraquiz/services/QuestionModel.dart';
import 'package:recriacao_devoraquiz/services/QuizQueCreator.dart';

// ignore: must_be_immutable
class LIPSAT1 extends StatefulWidget {
  late String questionsId;
  late String queQuestion;

  LIPSAT1({Key? key}) : super(key: key);

  @override
  State<LIPSAT1> createState() => _LIPSAT1State();
}

class _LIPSAT1State extends State<LIPSAT1> {
  QuestionModel questionModel = QuestionModel();
  genQue() async {
    await QuizQueCreator.genQuizque(widget.questionsId, widget.queQuestion)
        .then((queData) {
      setState(() {
        questionModel.question = queData["question"];
        questionModel.correctanswer = "Dormi bem";

        List options = [
          queData["op1"],
          queData["op2"],
          queData["op3"],
          queData["op4"],
        ];
        options.shuffle();

        questionModel.option1 = "Insonia";
        questionModel.option2 = "Dormi bem";
        questionModel.option3 = "Dificuldade ao acordar";
        questionModel.option4 = "...";
      });
    });
  }

  bool optALocked = false;
  bool optBLocked = false;
  bool optCLocked = false;
  bool optDLocked = false;
  bool optElocked = false;
  bool optFlocked = false;
  User? user = FirebaseAuth.instance.currentUser;

  final audioPlayer = AudioPlayer();
  bool isPlaying = false;

  // Check if the user is signed i

  /*
  @override
  void initState() {
    super.initState();
    genQue();
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 35, 82, 37),
        appBar: AppBar(
          title: Text(
            "Questões Lipídios Saturados",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 80,
                width: 80,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 10,
                      backgroundColor: Colors.white,
                    ),
                    CircleAvatar(
                      radius: 35,
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                        ),
                        iconSize: 50,
                        onPressed: () async {
                          if (isPlaying) {
                            await audioPlayer.pause();
                          } else {
                            await audioPlayer.play(
                                'https://docs.google.com/uc?export=download&id=1DntDWjBhOOL9rJfzyXTyUzTHe7tO0Jz_');
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.all(17),
                child: Text(
                  'Estouramos uma pipoca na panela para assistir a um filme em família. Comemos um balde médio de pipoca (300g) e pensei: quanto de gordura saturada será que tem aqui?',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    optALocked = true;
                  });
                },
                onLongPress: () {
                  setState(() {
                    optBLocked = true;
                    optCLocked = true;
                    optDLocked = true;
                    optElocked = true;
                    optFlocked = true;
                  });

                  final db = FirebaseFirestore.instance;

                  FirebaseAuth auth = FirebaseAuth.instance;
                  String? id = auth.currentUser?.uid;

                  var upScore = db.collection('users').doc(id);
                  upScore.update(
                    {'scorelipsat': FieldValue.increment(0)},
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: optALocked
                          ? Colors.red.withOpacity(0.8)
                          : Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  child: Image.network(
                    "https://i.imgur.com/cplhxqB.png",
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    optBLocked = true;
                  });
                },
                onLongPress: () {
                  setState(() {
                    optALocked = true;
                    optCLocked = true;
                    optDLocked = true;
                    optElocked = true;
                    optFlocked = true;
                  });

                  final db = FirebaseFirestore.instance;

                  FirebaseAuth auth = FirebaseAuth.instance;
                  String? id = auth.currentUser?.uid;

                  var upScore = db.collection('users').doc(id);
                  upScore.update(
                    {'scorelipsat': FieldValue.increment(0)},
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: optBLocked
                          ? Colors.red.withOpacity(0.8)
                          : Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  child: Image.network(
                    "https://i.imgur.com/aDNsEeH.png",
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    optCLocked = true;
                  });
                },
                onLongPress: () {
                  setState(() {
                    optBLocked = true;
                    optALocked = true;
                    optDLocked = true;
                    optElocked = true;
                    optFlocked = true;
                  });

                  final db = FirebaseFirestore.instance;

                  FirebaseAuth auth = FirebaseAuth.instance;
                  String? id = auth.currentUser?.uid;

                  var upScore = db.collection('users').doc(id);
                  upScore.update(
                    {'scorelipsat': FieldValue.increment(1)},
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: optCLocked
                          ? Colors.green.withOpacity(0.8)
                          : Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  child: Image.network(
                    "https://i.imgur.com/kNkcLRF.png",
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    optDLocked = true;
                  });
                },
                onLongPress: () {
                  setState(() {
                    optBLocked = true;
                    optALocked = true;
                    optCLocked = true;
                    optElocked = true;
                    optFlocked = true;
                  });

                  final db = FirebaseFirestore.instance;

                  FirebaseAuth auth = FirebaseAuth.instance;
                  String? id = auth.currentUser?.uid;

                  var upScore = db.collection('users').doc(id);
                  upScore.update(
                    {'scorelipsat': FieldValue.increment(0)},
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: optCLocked
                          ? Colors.red.withOpacity(0.8)
                          : Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  child: Image.network(
                    "https://i.imgur.com/FhzSlxI.png",
                    height: 65,
                    width: 65,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    optElocked = true;
                  });
                },
                onLongPress: () {
                  setState(() {
                    optBLocked = true;
                    optALocked = true;
                    optDLocked = true;
                    optCLocked = true;
                    optFlocked = true;
                  });

                  final db = FirebaseFirestore.instance;

                  FirebaseAuth auth = FirebaseAuth.instance;
                  String? id = auth.currentUser?.uid;

                  var upScore = db.collection('users').doc(id);
                  upScore.update(
                    {'scorelipsat': FieldValue.increment(0)},
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: optCLocked
                          ? Colors.red.withOpacity(0.8)
                          : Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  child: Image.network(
                    "https://i.imgur.com/umD6i0J.png",
                    height: 60,
                    width: 60,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      optALocked = true;
                      optBLocked = true;
                      optCLocked = true;
                      optDLocked = true;
                      optElocked = true;
                      optFlocked = true;
                    },
                  );
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LIPSAT2()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: optFlocked
                          ? Color.fromARGB(255, 81, 187, 136)
                          : Color.fromARGB(255, 81, 187, 136).withOpacity(0),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(14),
                  margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                  child: Text(
                    "Continuar",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: optDLocked
                            ? Colors.white
                            : Colors.white.withOpacity(0)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
