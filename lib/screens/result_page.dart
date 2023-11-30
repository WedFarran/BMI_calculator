import 'package:bmi_calculator/consenants.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static const String id = 'ResultPage';
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final bmiResult = args['bmiResult'];
    final resultText = args['resultText'];
    final interpretation = args['interpretation'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Text(
              'Your Results',
              style: heightTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCards(
                color: activeColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: resultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: bMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: bodyTextStyle,
                    )
                  ],
                )),
          ),
          BottomButton(
              onTap: () => Navigator.pop(context), title: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
