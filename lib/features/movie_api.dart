import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../services/movie_services.dart';
import '../constants/custom_colors.dart';

class MovieAPIPage extends StatelessWidget {
  static const routeName = '/movie_api_page';
  const MovieAPIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backColor,
      // appBar: AppBar(
      //   backgroundColor: CustomColors.backColor,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back_ios_new,
      //       color: Colors.black,
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image, icon and overlap widget
            Stack(children: [
              Container(
                color: Colors.amber,
                child: const Text("icon here"),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10))),
                child: Image.asset(
                  'assets/images/ford.jpg',
                ),
              ),
              Container(
                color: Colors.white,
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text("8.2/10"),
                        Text(
                          "150,212",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.star_border_rounded),
                          color: const Color.fromARGB(255, 8, 8, 8),
                          onPressed: () {
                            //typically show a page to implement ratings increase
                          },
                        ),
                        const Text(
                          "Rate This",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          color: Colors.green,
                          child: const Text(
                            "86",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const Text(
                          "Metascore",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "62 critic reviews",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]
                //
                ),
            // elevated banner
            // Container(),
            // title, year, rated, time
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Ford v Ferrari",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 20)),
                      Row(
                        children: const [
                          Text(
                            "2019",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "PH-13",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "2h 32min",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: CustomColors.secColor,
                        border: Border.all(color: CustomColors.outlineColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15))),
                    child: const Icon(
                      Icons.add,
                      color: CustomColors.backColor,
                      size: 18,
                    ),
                  )
                ],
              ),
            ),
            //genre
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                      // color: CustomColors.secColor,
                      border: Border.all(color: CustomColors.outlineColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: const Text("Action"),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  constraints: const BoxConstraints(maxWidth: 100),
                  decoration: BoxDecoration(
                      // color: CustomColors.secColor,
                      border: Border.all(color: CustomColors.outlineColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: const Text("Biography"),
                ),
                const SizedBox(
                  width: 12,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  width: 70,
                  decoration: BoxDecoration(
                      // color: CustomColors.secColor,
                      border: Border.all(color: CustomColors.outlineColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: const Text("Drama"),
                ),
              ],
            ),
            // plot summary
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Plot Summary",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "American car designer, Carroll Shelby and driver Kri Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order to match the ongoing moentary influx in the Mercedes company",
                  style: TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
            // cast and crew
            Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cast & Crew",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/img1.png'),
                          radius: 27,
                        ),
                        // Image.asset('asset/stuff.jpg', ),
                        Text(
                          'James',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        ),
                        Text(
                          'Mangold',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        ),
                        Text(
                          'Director',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/img2.png'),
                          radius: 27,
                        ),
                        // Image.asset('asset/stuff.jpg', ),
                        Text(
                          'Matt',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        ),
                        Text(
                          'Damon',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        ),
                        Text(
                          'Carroll',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/images/larg.jpg'),
                          radius: 27,
                        ),
                        // Image.asset('asset/stuff.jpg', ),
                        Text(
                          'Christian',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        ),
                        Text(
                          'Bale',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        ),
                        Text(
                          'Ken Miles',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        ClipRRect(
                          // backgroundImage: AssetImage('assets/img4.jpeg'),
                          // radius: 27,
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'assets/iu.png',
                            height: 30,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Image.asset('asset/stuff.jpg', ),
                        const Text(
                          'Caitriona',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        ),
                        const Text(
                          'Balfe',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        ),
                        const Text(
                          'Mollie',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 11),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
