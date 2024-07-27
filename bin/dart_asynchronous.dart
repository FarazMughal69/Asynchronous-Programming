// ignore_for_file: unused_local_variable

import 'dart:async';

import 'questions_model.dart';

void main() async {
  //Create a Dart program that demonstrates the use of streams to handle real-time data updates.

  // Create Stream by Controller
  StreamController<DataModel> controller = StreamController();
  bool isTimerClosed = false;
  DateTime time = updateData(controller, isTimerClosed);
  controller.stream.listen((newValue) {
    print('Received: ${newValue.value}');
  });

  //Subscribe Stream
  Stream<DataModel> stream = dataStream();
  stream.listen((event) {
    print('Value Received from Stream ${event.value}');
  });
}

Stream<DataModel> dataStream() async* {
  bool isStreamClosed = false;
  Timer(Duration(minutes: 1), () {
    isStreamClosed = true;
  });
  while (!isStreamClosed) {
    await Future.delayed(Duration(seconds: 1));
    String newValue = DateTime.now().toString();
    yield DataModel(newValue);
  }
}

DateTime updateData(
    StreamController<DataModel> controller, bool isTimerClosed) {
  DateTime time = DateTime.now();
  Timer periodicTimer;
  periodicTimer = Timer.periodic(Duration(seconds: 1), (timer) {
    String newValue = DateTime.now().toString();
    DataModel value = DataModel(newValue);
    controller.add(value);
  });
  Timer(Duration(minutes: 1), () {
    periodicTimer.cancel();
    controller.close(); // Close the stream controller when done
  });
  return time;
}

class DataModel {
  String value;
  DataModel(this.value);
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
