import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../calculator_brain.dart';
import '../consenants.dart';
import '../widgets/bottom_button.dart';
import '../widgets/icon_content.dart';
import '../widgets/reusable_card.dart';

enum Gender {
  male,
  female;
}

class InputPage extends StatefulWidget {
  static const String id = 'InputPage';
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;

  int height = 180;
  int weight = 60;
  int age = 20;
  selectedGender(Gender selectedGender) {
    selectedGender == Gender.male
        ? setState(() {
            maleCardColor = activeColor;
            femaleCardColor = inactiveColor;
          })
        : setState(() {
            maleCardColor = inactiveColor;
            femaleCardColor = activeColor;
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => selectedGender(Gender.male),
                      child: ReusableCards(
                        color: maleCardColor,
                        child: const IconContent(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => selectedGender(Gender.female),
                      child: ReusableCards(
                        color: femaleCardColor,
                        child: const IconContent(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: ReusableCards(
              color: activeColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: labelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: heightTextStyle,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle,
                      )
                    ],
                  ),
                  Slider(
                    activeColor: sliderActiveColor,
                    inactiveColor: sliderInActiveColor,
                    min: 120.0,
                    max: 220.0,
                    value: height.toDouble(),
                    onChanged: (double value) => setState(() {
                      height = value.toInt();
                    }),
                  )
                ],
              ),
            )),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCards(
                        color: activeColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: labelTextStyle,
                            ),
                            Text(
                              '$weight',
                              style: heightTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () => setState(() {
                                    weight--;
                                  }),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () => setState(() {
                                    weight++;
                                  }),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                  Expanded(
                    child: ReusableCards(
                        color: activeColor,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: labelTextStyle,
                            ),
                            Text(
                              '$age',
                              style: heightTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () => setState(() {
                                    age--;
                                  }),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () => setState(() {
                                    age++;
                                  }),
                                )
                              ],
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ),
            BottomButton(
                title: 'CALCULATE',
                onTap: () {
                  CalculatorBrain calc =
                      CalculatorBrain(height: height, weight: weight);
                  Navigator.pushNamed(context, ResultPage.id, arguments: {
                    'bmiResult': calc.calculateBMI(),
                    'resultText': calc.getResults(),
                    'interpretation': calc.getInterpretation()
                  });
                })
          ],
        ));
  }
}
