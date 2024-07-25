// ignore_for_file: unused_local_variable

import 'questions_model.dart';

void main(List<String> arguments) async {
  List<Questions> qstnLst = List.empty();
  try {
    qstnLst = await fetchQuestions(qstnLst);
    await printQuestions(qstnLst);
  } on Exception catch (ex) {
    print(ex);
  }
}

Future<void> printQuestions(List<Questions> qstnLst) async {
  for (var questions in qstnLst) {
    int optn = 1;
    print(questions.question);
    for (var option in questions.options) {
      print("$optn $option");
      optn++;
    }
  }
}

Future<List<Questions>> fetchQuestions(List<Questions> qstnLst) async {
  qstnLst = [
    Questions(
      question: "Capital of the Pakistan",
      answer: "Islambad",
      options: ["Lahore", "Islambad", "karachi", "haiderabad"],
    ),
    Questions(
      question: "What is the real name of the Quaid Azam",
      answer: "Muhammad Ali Jinnah",
      options: [
        "Alama Iqbal",
        'Muhammad Ali Jinnah',
        'sir syed Ahmad Ali Khan',
        "Indra Gandhi"
      ],
    ),
    Questions(
      question: "Capital of the Pakistan",
      answer: "Islambad",
      options: ["Lahore", "Islambad", "karachi", "haiderabad"],
    ),
  ];
  return Future(() => qstnLst);
}
