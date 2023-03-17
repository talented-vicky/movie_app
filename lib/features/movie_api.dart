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
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10))),
                child: Image.asset(
                  'assets/images/ford.jpg',
                ),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 15,
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.white,
                margin: const EdgeInsets.only(left: 10, top: 230),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(
                          "8.2/10",
                          style: TextStyle(fontSize: 11),
                        ),
                        Text(
                          "150,212",
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 2, bottom: 2),
                          color: const Color.fromARGB(255, 95, 196, 98),
                          child: const Text(
                            "86",
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          ),
                        ),
                        const Text(
                          "Metascore",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                        const Text(
                          "62 critic reviews",
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
            // title, year, rated, time
            Container(
              height: 50,
              padding: const EdgeInsets.only(left: 15, right: 15),
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
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
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
            ),
            // plot summary
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
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
            ),

            // cast and crew
            Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
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
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/img1.png'),
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
                              backgroundImage:
                                  AssetImage('assets/images/img2.png'),
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
                              backgroundImage:
                                  AssetImage('assets/images/larg.png'),
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
                          children: const [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('assets/images/emilie.jpg'),
                              radius: 27,
                            ),
                            // Image.asset('asset/stuff.jpg', ),
                            Text(
                              'Caitriona',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            Text(
                              'Balfe',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            Text(
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
                )),
          ],
        ),
      ),
    );
  }
}
