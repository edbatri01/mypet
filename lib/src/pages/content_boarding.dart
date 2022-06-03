import 'package:flutter/material.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class ContentBoarding extends StatelessWidget {
  const ContentBoarding({
    Key? key,
    required this.text,
    required this.text1,
    required this.image,
  }) : super(key: key);

  final String text, text1, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              image,
              width: 200,
              height: 200,
            ),
            Text(
              text,
              style: const TextStyle(
                color: ColorSelect.txtBoHe,
                fontSize: 21,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            text1,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: ColorSelect.txtBoSubHe,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
