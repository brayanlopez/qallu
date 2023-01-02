import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:qallu/components/question/question_body.dart';
import 'package:qallu/controllers/question_controller.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () => controller.nextQuestion(),
              child: const Text("skip"))
        ],
      ),
      body: const QuestionBody(key: Key("body")),
    );
  }
}
