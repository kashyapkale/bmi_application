import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String label;
  IconContent({@required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //SizedBox(height: 15),
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(height: 15),
        Text(label, style: kLableTextStyle)
      ],
    );
  }
}
