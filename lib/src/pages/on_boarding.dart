import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_flutter/src/pages/content_boarding.dart';
import 'package:login_flutter/src/pages/login.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int pages = 0;

  final PageController _pageViewController = PageController(initialPage: 0);
  List<Map<String, String>> onBoardingDatas = [
    {
      "text": 'ESPARCIMIENTO',
      "text1": 'Brindamos todos los servicios para consentir a tu mascota',
      'image': 'assets/images/B1.png'
    },
    {
      "text": 'ADOPCION',
      "text1": 'Adopta no compres',
      'image': 'assets/images/B2.png'
    },
    {
      "text": 'HOSPITALIDAD',
      "text1": 'Cuidaremos a tu mascota como si fuera nuetra',
      'image': 'assets/images/B3.png'
    },
    {"text": 'VETERINARIA', "text1": 'La mejor atención', 'image': 'assets/images/B4.png'},
    {"text": 'TIENDA', "text1": 'Los mejores productos', 'image': 'assets/images/B5.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    controller: _pageViewController,
                    onPageChanged: (value) {
                      setState(() {
                        pages = value;
                      });
                    },
                    itemCount: onBoardingDatas.length,
                    itemBuilder: (context, index) => ContentBoarding(
                      text: onBoardingDatas[index]["text"]!,
                      text1: onBoardingDatas[index]["text1"]!,
                      image: onBoardingDatas[index]["image"]!,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingDatas.length,
                          (index) => _animatedContainer(index: index),
                        ),
                      ),
                      _animatedButton(
                          width: 350.0,
                          height: 50.0,
                          index: onBoardingDatas.length - 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _animatedButton(
      {required double width, required double height, required int index}) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.only(top: 160),
      decoration: BoxDecoration(
        color: pages == index
            ? ColorSelect.btnBackgroundBo2
            : ColorSelect.btnBackgroundBo1,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color:
              pages == index ? ColorSelect.border2 : ColorSelect.border1,
          width: 2.0,
        ),
      ),
      child: OutlinedButton(
        onPressed: () => {
          //Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginPage())))
          pages == index ? Navigator.push(context, MaterialPageRoute(builder: ((context) => const LoginPage()))) : _pageViewController.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.easeInOutQuint)
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const LoginPage(),
          //   ),
          // ) 
        },
        style: ButtonStyle(
          side: MaterialStateProperty.all(
            BorderSide.lerp(
              const BorderSide(style: BorderStyle.none),
              const BorderSide(style: BorderStyle.none),
              10.0,
            ),
          ),
        ),
        child: Text(
          pages == index ? 'Continuar' : 'Siguiente',
          style: TextStyle(
            color: pages == index
                ? ColorSelect.btnTextBo2
                : ColorSelect.btnTextBo1,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  AnimatedContainer _animatedContainer({required int index}) {
    return AnimatedContainer(
      duration: kThemeAnimationDuration,
      height: 4,
      width: pages == index ? 20 : 12,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color:
            pages == index ? ColorSelect.paginatorNext : ColorSelect.paginator,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
