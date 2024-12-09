import 'package:bmi_app/calculator_brain.dart';
import 'package:bmi_app/components/bottom_button.dart';
import 'package:bmi_app/components/rounded_icon_button.dart';
import 'package:bmi_app/constants.dart';
import 'package:bmi_app/screens/resultpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_card.dart';
import '../components/icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  final String title;

  const InputPage({super.key, required this.title});
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(widget.title,
                  style: const TextStyle(color: Colors.white))),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                colour: selectedGender == Gender.male
                    ? kActiveCardColour
                    : kInactiveCardColour,
                cardChild: const IconContent(
                  label: 'MALE',
                  icon: FontAwesomeIcons.mars,
                ),
                onPress: () => setState(() {
                  selectedGender = Gender.male;
                }),
              )),
              Expanded(
                  child: ReusableCard(
                colour: selectedGender == Gender.female
                    ? kActiveCardColour
                    : kInactiveCardColour,
                onPress: () => setState(() {
                  selectedGender = Gender.female;
                }),
                cardChild: const IconContent(
                  label: 'FEMALE',
                  icon: FontAwesomeIcons.venus,
                ),
              )),
            ],
          )),
          Expanded(
              child: ReusableCard(
            colour: kActiveCardColour,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('HEIGHT',
                    style: TextStyle(color: Color(0xFF8D8E98))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: kNumberLabelStyle),
                    const Text('cm', style: kLabelTextStyle),
                  ],
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        height = value.toInt();
                      });
                    },
                    min: 120.0,
                    max: 220.0,
                  ),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('WEIGHT', style: kLabelTextStyle),
                    Text(weight.toString(), style: kNumberLabelStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        const SizedBox(width: 10.0),
                        RoundedIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('AGE', style: kLabelTextStyle),
                    Text(age.toString(), style: kNumberLabelStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundedIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        const SizedBox(width: 10.0),
                        RoundedIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          )),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                );
              }));
            },
            buttonTitle: 'CALCULATE',
          )
        ]));
  }
}
