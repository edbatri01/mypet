import 'dart:async';
import 'package:flutter/material.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class SliderImg extends StatefulWidget {
  const SliderImg({Key? key}) : super(key: key);

  @override
  State<SliderImg> createState() => _SliderImgState();
}

class _SliderImgState extends State<SliderImg> {
  late PageController _pageController;
  Timer? _timer;

  int activePage = 0;
  int activeInitialPage = 999;
  List<String> images = [
    'assets/images/animales1.jpg',
    'assets/images/animales2.jpg',
    'assets/images/animales3.jpg',
  ];

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.8, initialPage: 999);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      activeInitialPage++;
      _pageController.animateToPage(activeInitialPage,
          duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
            // itemCount: images.length,
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                // activePage = page;
                activePage = page % images.length;
              });
            },
            itemBuilder: (context, pagePosition) {
              bool active = pagePosition == activePage;
              return slider(images, pagePosition % images.length, active);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(images.length, activePage),
        ),
      ],
    );
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(images[pagePosition]))),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: currentIndex == index ? ColorSelect.txtBoHe : Colors.black26,
          shape: BoxShape.circle,
        ),
      );
    });
  }
}