import 'package:flutter/material.dart';
import '../constants.dart';


class RoundIconButton extends StatelessWidget {
  final IconData child;
  final void Function()? onTap;

  RoundIconButton({required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(onPressed: onTap,
      child:Icon(child),
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 56,height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),);
  }
}
