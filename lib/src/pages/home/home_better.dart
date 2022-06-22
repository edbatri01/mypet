import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login_flutter/src/models/CardView.dart';
import 'package:login_flutter/src/models/Caroulsel.dart';
import 'package:login_flutter/src/pages/home/pieces/grid.dart';
import 'package:login_flutter/src/styles/colors/colors_views.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:login_flutter/src/pages/canvas/navigation_canvas.dart';

import '../../models/Products.dart';

class HomeBetter extends StatefulWidget {
  const HomeBetter({Key? key}) : super(key: key);

  @override
  State<HomeBetter> createState() => _HomeBetterState();
}

Future<Caroulselmagee> getCaroulselImages() async {
  final resp = await http.post(
      Uri.parse('http://desarrollovan-tis.dedyn.io:4030/GetImagesCarousel'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"idChannel": "1"}));
  //print(resp.body);
  return caroulselmageeFromJson(resp.body);
}

Future<Products> getProducts() async {
  final resp = await http.post(
      Uri.parse('http://desarrollovan-tis.dedyn.io:4030/GetProductsByIdSeller'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"idSeller": "1"}));
  return productsFromJson(resp.body);
}

class _HomeBetterState extends State<HomeBetter> {
  String dropdownValue = 'Entregar a domicilio';
  String dropdownValue2 = 'Calle 10 9';
  int isPressed = 0;
  int isPressed2 = 0;

  var buttons = [
    {"text": "Alimento"},
    {"text": "Accesorios"},
    {"text": "Recompensas"},
    {"text": "Juguetes"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: ColorSelect.txtBoHe,
          elevation: 0,
          toolbarHeight: 60,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Tienda'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Icon(Icons.shopping_bag, size: 30
                      // height: 100,
                      // width: 40,
                      ),
                  const Icon(
                    Icons.notifications,
                    size: 30,
                    // height: 100,
                    // width: 40,
                  ),
                  Image.asset(
                    'assets/images/user.PNG',
                    color: ColorSelect.paginator,
                    fit: BoxFit.fill,
                    height: 30,
                    width: 30,
                  ),
                ],
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              //color: Colors.amberAccent,
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'Hola ',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Hack',
                                fontWeight: FontWeight.bold,
                                color: ColorSelect.blackColor),
                          ),
                          Text(
                            'Juan,',
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Hack',
                                fontWeight: FontWeight.bold,
                                color: ColorSelect.greenColor),
                          ),
                        ],
                      ),
                      SizedBox(
                        //color: Colors.redAccent,
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          'assets/images/B2.png',
                          width: 50,
                          height: 50,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/gpspet.PNG',
                            width: 30,
                            height: 30,
                            fit: BoxFit.fill,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                'Entregar Ahora',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Hack',
                                    color: ColorSelect.blackColor),
                              ),
                              dropdownMethod2()
                            ],
                          ),
                        ],
                      ),
                      dropdownMethod1()
                    ],
                  ),
                  const Divider(thickness: 1),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mis macotas',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Hack',
                            fontWeight: FontWeight.bold,
                            color: ColorSelect.blackColor),
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.grey,
                            ),
                          ),
                          const Text('Agregar mascota'),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 130,
                        height: 180,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.purple),
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(12, 12))),
                        child: Card(
                          //shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(12,12))),
                          //margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/B5.png',
                                  width: 90, height: 120),
                              const Text(
                                'PRODUCTOS',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Hack',
                                    fontWeight: FontWeight.bold,
                                    color: ColorSelect.greenColor),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 130,
                        height: 180,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.purple),
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(12, 12))),
                        child: Card(
                          //shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.elliptical(12,12))),
                          //margin: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/B1.png',
                                  width: 90, height: 120),
                              const Text(
                                'SERVICIOS',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Hack',
                                    fontWeight: FontWeight.bold,
                                    color: ColorSelect.greenColor),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 250,
                        height: 35,
                        //color: Colors.greenAccent,
                        decoration: BoxDecoration(
                          //color: Colors.greenAccent,
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        margin: const EdgeInsets.all(12),
                        child: Row(
                          children: const <Widget>[
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Buscar productos o servicios",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 8),
                                  isDense: true,
                                ),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Icon(
                                Icons.search,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.format_list_bulleted_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.pink,
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(5),
                          ),
                        ),
                      ),
                      //TextButton.icon(onPressed: null, icon: const Icon(Icons.format_list_bulleted_outlined), label: const Text(''))
                    ],
                  ),
                  FutureBuilder(
                      future: getCaroulselImages(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Caroulselmagee> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          //print(snapshot.data);
                          return _ListUrlsCarousel(
                              snapshot.data!.dtoImageCarousels);
                        }
                      }),
                  Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 10),
                      child: const Divider(thickness: 1)),
                  Row(
                    children: [
                      const Text(
                        'Productos cerca',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Hack',
                            fontWeight: FontWeight.bold,
                            color: ColorSelect.blackColor),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      SizedBox(
                          //color: Colors.amberAccent,
                          width: 250,
                          height: 25,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: buttons.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              isPressed = index;
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: isPressed == index
                                                ? Colors.green
                                                : Colors.white),
                                        // style: ButtonStyle(
                                        //   backgroundColor: MaterialStateProperty.all(Colors.white),
                                        // ),
                                        child: Text(
                                          buttons[index]['text'].toString(),
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        )),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 5))
                                  ],
                                );
                              }))
                    ],
                  ),
                  FutureBuilder(
                      future: getProducts(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Products> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          return _ListProducts(
                              snapshot.data!.getProducts.response.docs);
                        }
                      }),
                  Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      child: const Divider(thickness: 1)),
                  Row(
                    //servicios cerca
                    children: [
                      const Text(
                        'Servicios cerca',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Hack',
                            fontWeight: FontWeight.bold,
                            color: ColorSelect.blackColor),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 5)),
                      SizedBox(
                          //color: Colors.amberAccent,
                          width: 250,
                          height: 25,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: buttons.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          setState(
                                            () {
                                              isPressed2 = index;
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: isPressed2 == index
                                                ? Colors.purple
                                                : Colors.white),
                                        // style: ButtonStyle(
                                        //   backgroundColor: MaterialStateProperty.all(Colors.white),
                                        // ),
                                        child: Text(
                                          buttons[index]['text'].toString(),
                                          style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.black),
                                        )),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 5))
                                  ],
                                );
                              }))
                    ],
                  ),
                  FutureBuilder(
                      future: getProducts(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Products> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else {
                          return _ListProducts(
                              snapshot.data!.getProducts.response.docs);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          child: CustomPaint(
            painter: _CustomPainter2(),
            child: Container(
              padding: const EdgeInsets.only(bottom: 5, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/home.png',
                    width: 40,
                    height: 40,
                  ),
                  Image.asset(
                    'assets/images/list.PNG',
                    width: 40,
                    height: 40,
                  ),
                  Image.asset(
                    'assets/images/pet2.png',
                    width: 40,
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Container dropdownMethod2() {
    return Container(
      //color: Colors.greenAccent,
      width: 90,
      height: 30,
      margin: const EdgeInsets.only(right: 15),
      //alignment: AlignmentDirectional.centerStart,
      // color: Colors.grey[200],
      child: DropdownButton<String>(
        // alignment: AlignmentDirectional.centerEnd,
        value: dropdownValue2,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 0,
        style:
            const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        underline: Container(
          height: 0,
          color: Colors.black54,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue2 = newValue!;
          });
        },
        items: <String>[
          'Calle 10 9',
          'Calle 10 8',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Container dropdownMethod1() {
    return Container(
      //width: 90,
      height: 30,
      alignment: AlignmentDirectional.center,
      // color: Colors.grey[200],
      child: DropdownButton<String>(
        // alignment: AlignmentDirectional.centerEnd,
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 0,
        style:
            const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
        underline: Container(
          height: 0,
          color: Colors.black54,
        ),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'Entregar a domicilio',
          'Recoger',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class _ListProducts extends StatelessWidget {
  final List<Doc> imgProducts;
  const _ListProducts(this.imgProducts);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(top: 0, left: 8),
      child: GridView.count(
        mainAxisSpacing: 0,
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 1,
        scrollDirection: Axis.horizontal,
        children: List.generate(imgProducts.length, (index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Scaffold(
                          appBar: AppBar(
                            backgroundColor: ColorSelect.txtBoHe,
                            elevation: 0,
                            toolbarHeight: 60,
                            leading: IconButton(
                              onPressed: () => {Navigator.pop(context)},
                              icon: const Icon(
                                Icons.arrow_back,
                                color: ColorSelect.paginatorNext,
                                size: 30,
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Producto'),
                                SizedBox(
                                  width: 85,
                                  height: 45,
                                  child: Image.asset(
                                    'assets/images/splash.png',
                                    color: ColorSelect.paginator,
                                    fit: BoxFit.fill,
                                    // height: 100,
                                    // width: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          body: Container(
                            margin: const EdgeInsets.all(15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  imgProducts[index].urlImage.toString(),
                                  width: 100,
                                  height: 100,
                                ),
                                Text(imgProducts[index].name.toString()),
                                Text(imgProducts[index].description.toString()),
                                Text(imgProducts[index].price.toString())
                              ],
                            ),
                          ),
                        ))),
            child: Container(
              margin: const EdgeInsets.only(right: 32),
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(255, 241, 241, 241),
                    width: 1,
                  )),
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      imgProducts[index].urlImage.toString(),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        imgProducts[index].name.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      child: Text(
                        imgProducts[index].description.toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: Colors.grey),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "\$",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          imgProducts[index].price.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _ListUrlsCarousel extends StatelessWidget {
  final List<DtoImageCarousel> imgCarousel;

  const _ListUrlsCarousel(this.imgCarousel);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          height: 120.0,
          aspectRatio: 16 / 9,
          //viewportFraction: 1,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          //onPageChanged: callbackFunction,
          scrollDirection: Axis.horizontal,
        ),
        items: [
          Image.network(imgCarousel[0].url,
              fit: BoxFit.fill, width: double.infinity, height: 100),
          Image.network(imgCarousel[1].url,
              fit: BoxFit.fill, width: double.infinity, height: 100),
          Image.network(imgCarousel[2].url,
              fit: BoxFit.fill, width: double.infinity, height: 100)
        ]
        //   ListView.builder(
        //   itemCount: 1,
        //   itemBuilder: (BuildContext context, int i){

        //         return Image.network(imgCarousel[1].url, fit: BoxFit.fill, width: double.infinity,height: 100);
        //         // items: [imgCarousel].map((e){
        //         //     return Builder(
        //         //       builder: (BuildContext context){
        //         //         //return Text('$e');
        //         //         return Image.network(
        //         //           e[i].url,
        //         //           fit: BoxFit.fill,
        //         //           width: double.infinity,
        //         //           height: 10,

        //         //         );
        //         //       }
        //         //     );
        //         // }).toList(),

        //   }
        // ),],

        );
  }
}

class _CustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, size.height * 0.1128000);
    path.quadraticBezierTo(
      size.width * 0.0902041,
      size.height * -0.0123000,
      size.width * 0.1633929,
      size.height * 0.0103000,
    );
    path.cubicTo(
        size.width * 0.2879847,
        size.height * -0.0231000,
        size.width * 0.2751786,
        size.height * 0.2655000,
        size.width * 0.5131633,
        size.height * 0.2771000);
    path.cubicTo(
        size.width * 0.6660204,
        size.height * 0.2665000,
        size.width * 0.6857398,
        size.height * 0.2169000,
        size.width * 0.7969133,
        size.height * 0.0897000);
    path.quadraticBezierTo(
      size.width * 0.8737500,
      size.height * -0.0645000,
      size.width * 0.9985969,
      size.height * 0.0723000,
    );
    path.lineTo(size.width * 0.9985969, size.height * 1.0058000);
    path.lineTo(size.width * -0.0014031, size.height * 1.0058000);
    path.lineTo(0, size.height * 0.1128000);
    path.close();
    canvas.drawPath(path, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
