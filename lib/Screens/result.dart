import 'package:bmiapplication/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultPage extends StatelessWidget {
  String resultMsg;
  String result;
  String resultStatus;

  ResultPage(this.result, this.resultMsg, this.resultStatus);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resuls for BMI"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              "Your Results",
              style: kTitleTextStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultStatus.toUpperCase(),
                    style: TextStyle(color: Colors.green, fontSize: 30),
                  ),
                  Text(
                    result,
                    style: kBMITextStyle,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      resultMsg,
                      style: TextStyle(color: Colors.green, fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(5),
              color: Colors.red,
              width: double.maxFinite,
              child: FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Re-Calculate",
                ),
              ))
        ],
      ),
    );
  }
}
