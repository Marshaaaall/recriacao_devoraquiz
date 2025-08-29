import 'package:cloud_firestore/cloud_firestore.dart';

class QuizQueCreator {
  static Future<Map> genQuizque(String questionsId, String queQuestion) async {
    late Map queData;

    await FirebaseFirestore.instance
        .collection("quizzes")
        .doc(questionsId)
        .collection("questions")
        .where("question", isEqualTo: queQuestion)
        .get()
        .then((value) {
      queData = value.docs.elementAt(0).data();
    });
    print(queData);
    return queData;
  }
}
