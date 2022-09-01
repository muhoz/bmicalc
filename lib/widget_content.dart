import 'package:flutter/material.dart';

class Containerstyle extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function()? onPress;
  const Containerstyle(this.colour, this.cardChild, this.onPress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
