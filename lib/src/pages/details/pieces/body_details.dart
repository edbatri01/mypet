import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/CardView.dart';

class BodyDetails extends StatelessWidget {
  final CardView card;
  const BodyDetails({Key? key, required this.card}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            card.image,
            width: 200,
            height: 200,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Text(
              card.description,
              style: const TextStyle(fontSize: 30.0),
            ),
          ),
        ],
      ),
    );
  }
}