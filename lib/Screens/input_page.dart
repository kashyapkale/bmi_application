import 'package:bmiapplication/Screens/result.dart';
import 'package:bmiapplication/components/calculator.dart';
import 'package:bmiapplication/components/reusable_card.dart';
import 'package:bmiapplication/components/roundactionButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/icon_content.dart';
import '../constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Color(0xFF0A0E21),
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  //Gender Selection Widget
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: "MALE",
                        )),
                  ),
                  Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInactiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: "FEMALE",
                        )),
                  )
                ],
              ),
            ),

            //Height Selection Widget
            Expanded(
                child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Height",
                          style: kLableTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              "cm",
                              style: kLableTextStyle,
                            )
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          activeColor: Color(0xFFEB1555),
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.floor();
                            });
                          },
                        )
                      ],
                    ))),

            //Weight and Age Selection Widget
            Expanded(
              child: Row(
                children: <Widget>[
                  //Weight Selection Widget
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "WEIGHT",
                            style: kLableTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                displayIcon: Icon(Icons.add),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                displayIcon: Icon(FontAwesomeIcons.minus),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  //Age Selection Widget
                  Expanded(
                    child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "AGE",
                            style: kLableTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                displayIcon: Icon(Icons.add),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              RoundIconButton(
                                onPress: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                displayIcon: Icon(FontAwesomeIcons.minus),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(5),
                color: Colors.red,
                width: double.maxFinite,
                child: FlatButton(
                  onPressed: () {
                    CalculatorBrain calc =
                        new CalculatorBrain(height: height, weight: weight);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(
                              calc.calculateResult(),
                              calc.getResultMsg(),
                              calc.getResultStatus())),
                    );
                  },
                  child: Text(
                    "Calculate",
                  ),
                ))
          ],
        ));
  }
}
