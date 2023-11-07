import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imagesList = [
    'https://i.imgur.com/jjFMyNH.png',
    'https://i.imgur.com/fSebNGR.png',
    'https://i.imgur.com/vqd0fiL.png',
    'https://i.imgur.com/jjFMyNH.png',
    'https://i.imgur.com/fSebNGR.png',
    'https://i.imgur.com/vqd0fiL.png',
  ];
  List<String> ten = [
    'Da Nang - Ba Na - Hoi An',
    'Melbourne - Sydney',
    'Hanoi - Ha Long Bay',
    'Da Nang - Ba Na - Hoi An',
    'Melbourne - Sydney',
    'Hanoi - Ha Long Bay',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 500,
                  height: 247,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://i.imgur.com/XxUtQiU.png"),
                        fit: BoxFit.fill
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150,left: 30),
                  child: SizedBox(
                    width: 330,
                    child: Text(
                      'Plenty of amazing of tours are waiting for you',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'SF Pro Display',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 225),
                  width: 440,
                  height: 40,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x28000000),
                        blurRadius: 12,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, top: 235),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                      ),
                      Text(
                        'Hi, where do you want to explore? ',
                        style: TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 16,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),

                    ],
                  ),

                ),

              ],

            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: imagesList.length,

                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 470,
                          height: 187,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                    image: NetworkImage(imagesList[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 145,left: 15),
                                child: Row(
                                  children: [
                                    RatingBar.builder(
                                      initialRating: 5,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: 24,
                                      itemPadding:
                                      EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 10),
                                        child: Text(
                                          "1247 Likes",
                                          style: TextStyle(color: Colors.white),
                                        ))
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              margin: EdgeInsets.only(left: 15,top: 15),
                              child: Text(
                                ten[index],
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10, top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                  ),
                                  Text(
                                    'Jan 30,2020',
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10,bottom: 20, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.access_time_filled_rounded,
                                  ),
                                  Text(
                                    '3 days',
                                  ),
                                  SizedBox(
                                    width: 320,
                                  ),
                                  Icon(
                                    Icons.attach_money,
                                    color: Color(0xFF00CEA6),
                                  ),
                                  Text(
                                    '400.00',
                                    style: TextStyle(
                                        fontSize: 20, color: Color(0xFF00CEA6)),
                                  )
                                ],
                              ),
                            ),

                          ],
                        )
                      ],
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
