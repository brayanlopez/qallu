import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qallu/controllers/question_controller.dart';
import 'package:qallu/models/questions.dart';

import '../../../constants.dart';
import 'question_option.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({
    required Key key,
    // it means we have to pass this
    required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController questionController = Get.put(QuestionController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 3 / 4),
      padding: const EdgeInsets.all(kDefaultPadding * 3 / 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: kBlackColor),
          ),
          const SizedBox(height: kDefaultPadding / 4),
          ...List.generate(
            question.options.length,
            (index) => QuestionOption(
              key: Key("$index"),
              index: index,
              text: question.options[index],
              press: () => questionController.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
