import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/CardView.dart';

class Grid extends StatelessWidget {
  final CardView card;
  final Function() press;
  const Grid({
    Key? key,
    required this.card,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Image.asset(
              card.image,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}