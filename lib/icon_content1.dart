import 'package:flutter/material.dart';
import 'constaints.dart';
import 'dart:math' as math;

class ColumnDesign1 extends StatelessWidget {
  final IconData icone;
  final String texte;
  final Color color1;

  const ColumnDesign1({Key? key, required this.icone, required this.texte, required this.color1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: math.pi/4,
          child: Icon(
            icone,
            size: 110.0,
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          texte,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
