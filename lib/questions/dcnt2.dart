// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recriacao_devoraquiz/questions/dcnt3.dart';
import 'package:recriacao_devoraquiz/services/QuestionModel.dart';
import 'package:recriacao_devoraquiz/services/QuizQueCreator.dart';

import '../pages/questionsLipIns.dart';

// ignore: must_be_immutable
class DCNT2 extends StatefulWidget {
  late String questionsId;
  late String queQuestion;

  DCNT2({Key? key}) : super(key: key);

  @override
  State<DCNT2> createState() => _DCNT2State();
}

class _DCNT2State extends State<DCNT2> {
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

  User? user = FirebaseAuth.instance.currentUser;

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
            "Questões DCNTs - 2",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                children: const [
                  CircularProgressIndicator(
                    strokeWidth: 10,
                    backgroundColor: Colors.white,
                  ),
                  Center(
                    child: Text(
                      "2",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20)),
              padding: EdgeInsets.all(14),
              margin: EdgeInsets.all(17),
              child: Text(
                'Com qual situção você mais se identifica ao tomar seu café da manhã?',
                style: TextStyle(fontSize: 25),
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
                });

                final db = FirebaseFirestore.instance;
                String? useruid = user?.uid;
                useruid = useruid?.split("'")[0];

                var upScore = db.collection('users').doc(useruid);
                upScore.update(
                  {'scoredcnt': FieldValue.increment(5)},
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
                child: Text(
                  "A. Não toma",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
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
                });

                final db = FirebaseFirestore.instance;
                String? useruid = user?.uid;
                useruid = useruid?.split("'")[0];

                var upScore = db.collection('users').doc(useruid);
                upScore.update(
                  {'scoredcnt': FieldValue.increment(10)},
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: optBLocked
                        ? Colors.yellow.withOpacity(0.8)
                        : Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                child: Text(
                  "B. Café com pão e manteiga",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
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
                });

                final db = FirebaseFirestore.instance;
                String? useruid = user?.uid;
                useruid = useruid?.split("'")[0];

                var upScore = db.collection('users').doc(useruid);
                upScore.update(
                  {'scoredcnt': FieldValue.increment(15)},
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
                child: Text(
                  "C. Café completo(Frutas)",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
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
                  },
                );
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => DCNT3()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: optDLocked
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
    );
  }
}
