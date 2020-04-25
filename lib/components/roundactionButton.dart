import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundIconButton extends StatelessWidget {
  Function onPress;
  Icon displayIcon;
  RoundIconButton({this.onPress, this.displayIcon});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      onPressed: onPress,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      fillColor: Color(0xFF4C4F5E),
      child: displayIcon,
    );
  }
}
