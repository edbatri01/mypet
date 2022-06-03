import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/CardView.dart';
import 'package:login_flutter/src/pages/details/details.dart';
import 'package:login_flutter/src/pages/home/pieces/carousel.dart';
import 'package:login_flutter/src/pages/home/pieces/grid.dart';
import 'package:login_flutter/src/pages/home/pieces/slider.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SliderImg(),
          const Carousel(),
          Container(
            height: 180,
            decoration: const BoxDecoration(
              color: ColorSelect.btnBackgroundBo2,
            ),
            margin: const EdgeInsets.all(20),
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GridView.builder(
                  itemCount: cards.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 25.0,
                    crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (ctx, index) => Grid(
                    card: cards[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => DetailsScreen(
                          card: cards[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}