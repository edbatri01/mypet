// CarouselSlider(
//                   options: CarouselOptions(
//                     height: 100.0, 
//                     aspectRatio : 16 / 9,
//                     //viewportFraction: 1,
//                     enableInfiniteScroll: true,
//                     reverse: false,
//                     autoPlay: true,
//                     autoPlayInterval: const Duration(seconds: 3),
//                     autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                     autoPlayCurve: Curves.fastOutSlowIn,
//                     enlargeCenterPage: true,
//                     //onPageChanged: callbackFunction,
//                     scrollDirection: Axis.horizontal,
//                   ),
//                   items: [
//                     FutureBuilder(
//                       future: getCaroulselImages(),
//                       builder: (BuildContext context, AsyncSnapshot<Caroulselmagee> snapshot){
//                         if( snapshot.connectionState == ConnectionState.waiting){
//                           return const CircularProgressIndicator();
//                         }
//                         else{
//                           return _ListUrlsCarousel(snapshot.data!.dtoImageCarousels);
//                         }
//                       }
//                     )
//                   ],
                  // items: ['assets/images/hotsale.png','assets/images/petcare.jpg','assets/images/pet.jpg'].map((i) {
                  //   return Builder(
                  //     builder: (BuildContext context) {
                  //       return Image.asset(
                  //         i,
                  //         fit: BoxFit.fill,
                  //         width: double.infinity,
                  //         height: 10,
                  //       );
                  //     },
                  //   );
                  // }).toList(),
                //)

//----------------------------------------------------------


// Container( //grid1
//                           // flex: 2,
//                               height: 200,
//                               margin: const EdgeInsets.only(top: 0, left: 8),
//                               // width: 200,

//                               // color: Colors.amber,
//                               child: GridView.count(
//                                 mainAxisSpacing: 0,
//                                 physics: const BouncingScrollPhysics(),
//                                 crossAxisCount: 1,
//                                 scrollDirection: Axis.horizontal,
//                                 children: List.generate(images.length, (index) {
//                                   return GestureDetector(
//                               onTap: () => Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Scaffold(
//                                   appBar: AppBar(
//                                     backgroundColor: ColorSelect.txtBoHe,
//                                     elevation: 0,
//                                     toolbarHeight: 60,
//                                     leading: IconButton(
//                                       onPressed: () => {
//                                         Navigator.pop(context)
//                                       },
//                                       icon: const Icon(
//                                         Icons.arrow_back,
//                                         color: ColorSelect.paginatorNext,
//                                         size: 30,
//                                       ),
//                                     ),
//                                     title: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         const Text('Producto'),
//                                         SizedBox(
//                                           width: 85,
//                                           height: 45,
//                                           child: Image.asset(
//                                             'assets/images/splash.png',
//                                             color: ColorSelect.paginator,
//                                             fit: BoxFit.fill,
//                                             // height: 100,
//                                             // width: 40,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   body: Container(
//                                     margin: const EdgeInsets.all(15),
//                                     child: Column(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       children: [
//                                         Image.asset(
//                                           images[index]['image'].toString()
//                                         ),
//                                         Text(
//                                           images[index]['name'].toString()
//                                         ),
//                                         Text(
//                                           images[index]['desc'].toString()
//                                         ),
//                                         Text(
//                                           images[index]['price'].toString()
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ))),
                        
//                         child: Container(
//                           margin: const EdgeInsets.only(right: 32),
//                           width: 100,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                               color:const  Color.fromARGB(255, 241, 241, 241),
//                               width: 1,
//                             ),
//                           ),
//                           child: Container(
//                             margin: const EdgeInsets.only(left: 5),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Image.asset(
//                                   images[index]['image'].toString(),
//                                   fit: BoxFit.cover,
//                                   width: 100,
//                                   height: 100,
//                                 ),
//                                 Container(
//                                   alignment: Alignment.topLeft,
//                                   child: Text(
//                                     images[index]['name'].toString(),
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 18,
//                                         color: Colors.green),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 170,
//                                   // color: Colors.greenAccent,
//                                   child: Text(
//                                     images[index]['desc'].toString(),
//                                     style: const TextStyle(
//                                         fontWeight: FontWeight.normal,
//                                         fontSize: 15,
//                                         color: Colors.grey),
//                                   ),
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     const Text(
//                                       "\$",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold, fontSize: 17),
//                                     ),
//                                     Text(
//                                       images[index]['price'].toString(),
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold, fontSize: 17),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),


// Container(
//                     //grid2
//                     // flex: 2,
//                     height: 200,
//                     margin: const EdgeInsets.only(top: 0, left: 8),
//                     // width: 200,

//                     // color: Colors.amber,
//                     child: GridView.count(
//                       mainAxisSpacing: 0,
//                       physics: const BouncingScrollPhysics(),
//                       crossAxisCount: 1,
//                       scrollDirection: Axis.horizontal,
//                       children: List.generate(images2.length, (index) {
//                         return GestureDetector(
//                           onTap: () => Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => Scaffold(
//                                         appBar: AppBar(
//                                           backgroundColor: ColorSelect.txtBoHe,
//                                           elevation: 0,
//                                           toolbarHeight: 60,
//                                           leading: IconButton(
//                                             onPressed: () =>
//                                                 {Navigator.pop(context)},
//                                             icon: const Icon(
//                                               Icons.arrow_back,
//                                               color: ColorSelect.paginatorNext,
//                                               size: 30,
//                                             ),
//                                           ),
//                                           title: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               const Text('Servicios'),
//                                               SizedBox(
//                                                 width: 85,
//                                                 height: 45,
//                                                 child: Image.asset(
//                                                   'assets/images/splash.png',
//                                                   color: ColorSelect.paginator,
//                                                   fit: BoxFit.fill,
//                                                   // height: 100,
//                                                   // width: 40,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         body: Container(
//                                           margin: const EdgeInsets.all(15),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.center,
//                                             children: [
//                                               Image.asset(images2[index]
//                                                       ['image']
//                                                   .toString()),
//                                               Text(images2[index]['name']
//                                                   .toString()),
//                                               Text(images2[index]['desc']
//                                                   .toString()),
//                                               Text(images2[index]['price']
//                                                   .toString())
//                                             ],
//                                           ),
//                                         ),
//                                       ))),
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 32),
//                             width: 100,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               border: Border.all(
//                                 color: const Color.fromARGB(255, 241, 241, 241),
//                                 width: 1,
//                               ),
//                             ),
//                             child: Container(
//                               margin: const EdgeInsets.only(left: 5),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     decoration: const BoxDecoration(
//                                         //border: Border.all(width: 1, color: Colors.purple),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(12))),
//                                     child: Image.asset(
//                                       images2[index]['image'].toString(),
//                                       fit: BoxFit.cover,
//                                       width: 100,
//                                       height: 100,
//                                     ),
//                                   ),
//                                   Container(
//                                     alignment: Alignment.topLeft,
//                                     child: Text(
//                                       images2[index]['name'].toString(),
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18,
//                                           color: Colors.green),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 170,
//                                     // color: Colors.greenAccent,
//                                     child: Text(
//                                       images2[index]['desc'].toString(),
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           fontSize: 15,
//                                           color: Colors.grey),
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       const Text(
//                                         "\$",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 17),
//                                       ),
//                                       Text(
//                                         images2[index]['price'].toString(),
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 17),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   )


//final List<DtoImageCarousel> caroulsels;
  // var images = [
  //   {
  //     "image": "assets/images/bolfo.jpg",
  //     "name": "Bolfo",
  //     "desc":
  //         "Lorem ipsum",
  //         "price":200
  //   },
  //   {
  //     "image": "assets/images/caniforte.jpg",
  //     "name": "Caniforte",
  //     "desc":
  //         "Lorem ipsum",
  //         "price":200
  //   },
  //   {
  //     "image": "assets/images/canitabs.jpg",
  //     "name": "Canitabs",
  //     "desc":
  //         "Lorem ipsum",
  //         "price":200
  //   },
  //   {
  //     "image": "assets/images/dipramida.jpg",
  //     "name": "Dipramida",
  //     "desc":
  //         "Lorem ipsum",
  //         "price":200
  //   },
  //   {
  //     "image": "assets/images/ivermectina.jpg",
  //     "name": "Ivermectina",
  //     "desc":
  //         "Lorem ipsum",
  //         "price":200
  //   },
  //   {
  //     "image": "assets/images/nexgard.jpg",
  //     "name": "Nexgard",
  //     "desc":
  //         "Lorem ipsum",
  //         "price":200
  //   },
  //   {
  //     "image": "assets/images/novabismol.jpg",
  //     "name": "Novabismol",
  //     "desc":
  //         "Lorem ipsum",
  //         "price":200
  //   },
  //   {
  //     "image": "assets/images/proventis.png",
  //     "name": "Proventis",
  //     "desc":
  //         "Lorem ipsum",
  //         "price":200
  //   }
  // ];

  // var images2 = [
  //   {
  //     "image": "assets/images/paseo.jpg",
  //     "name": "Tistabene",
  //     "desc": "Descripción",
  //     "price": 125
  //   },
  //   {
  //     "image": "assets/images/showerDog.jpg",
  //     "name": "Van Hesuem",
  //     "desc": "Descripción",
  //     "price": 140
  //   },
  //   {
  //     "image": "assets/images/rest.webp",
  //     "name": "Food",
  //     "desc": "Descripción",
  //     "price": 60
  //   },
  //   {
  //     "image": "assets/images/festudio.jpg",
  //     "name": "Photograph",
  //     "desc": "Descripción",
  //     "price": 50
  //   },
  // ];