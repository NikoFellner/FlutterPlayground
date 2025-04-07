import 'package:flutter/material.dart';
import '../constants.dart';

class ReusableIcon extends StatelessWidget {
  final String descriptionText;
  final IconData iconToShow;
  final Color descriptionTextColor;

  ReusableIcon({required this.descriptionText, required this.iconToShow, required this.descriptionTextColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconToShow, size: 100,),
        SizedBox(height: 30,),
        Text(descriptionText, style: kLabelTextStyle,)
      ],
    );
  }
}