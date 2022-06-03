import 'package:flutter/material.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  
  List<String> images = [
    'assets/images/animales1.jpg',
    'assets/images/animales2.jpg',
    'assets/images/animales3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: ColorSelect.btnBackgroundBo2,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      margin: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(images[index % 3]),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}