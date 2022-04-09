import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Question> testList = [];
Future<dynamic> getdata() async {
  var response =
      await http.get(Uri.parse('https://opentdb.com/api.php?amount=1'));

  print("a-------------------------");
  print("******************${response.runtimeType}");
  // print(response.body['result']);
  // print(json.decode(response.body)['results']);
  // print(response.body);

  if (response.statusCode == 200) {
    jsonDecode(response.body)['results'].forEach((dynamic doc) {
      // return Question.fromJson();
      print('???======================');
      print(doc['correct_answer']);
      testList.add(Question.fromJson(doc as Map<String, dynamic>));
    });
    return testList;

    // jsonDecode(response.body)['results'] as Map<String, dynamic>);

  } else {
    throw Exception("Failed to load data");
  }
}

class Screen_2 extends StatefulWidget {
  const Screen_2({Key? key}) : super(key: key);

  @override
  State<Screen_2> createState() => _Screen_2State();
}

class _Screen_2State extends State<Screen_2> {
  Question? _character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions'),
      ),
      body: Column(
        children: [
          Center(
            child: FutureBuilder<dynamic>(
                future: getdata(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    print(testList[0].category.toString());
                    return Column(
                      children: [
                        Text(testList[0].question.toString()),
                        // Text(testList[0].correct_answer.toString()),

                        // ignore: avoid_print

                        // ListTile(
                        //   title: const Text('Lafayette'),
                        //   leading: Radio<Question>(
                        //     value: testList[0].incorrectAnswer,
                        //     groupValue: _character,
                        //     onChanged: (Question? value) {
                        //       setState(() {
                        //         _character = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                      ],``
                    );
                  } else if (snapshot.hasError) {}
                  return CircularProgressIndicator();
                }),
          ),
        ],
      ),
    );
  }
}

class Question {
  dynamic category, type, difficulty, question, correctAnswer, incorrectAnswer;
  Question({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    print(json);
    return Question(
        category: json['category'],
        type: json['type'],
        difficulty: json['difficulty'],
        question: json['question'],
        correctAnswer: json['correct_answer'],
        incorrectAnswer: json['incorrectAnswer']);
  }
}
