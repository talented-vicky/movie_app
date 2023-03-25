import 'package:flutter/material.dart';

// import '../models/movie.dart';
// import '../services/movie_services.dart';
import '../constants/custom_colors.dart';

class MovieAPIPage extends StatelessWidget {
  final String bannerurl,
      rating,
      ratingcount,
      // popularity,
      // criticreviews,
      title,
      release,
      // rated,
      streamtime,
      summary;
  const MovieAPIPage(
      {Key? key,
      required this.bannerurl,
      required this.rating,
      required this.ratingcount,
      // required this.popularity,
      // required this.criticreviews,
      required this.title,
      required this.release,
      // required this.rated,
      required this.streamtime,
      required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backColor,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // image, icon and overlap widget
            Stack(children: [
              // top background image
              ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(30)),
                // child: Image.asset(
                //   'assets/images/ford.jpg',
                // ),
                child: Image.network(
                  bannerurl,
                  fit: BoxFit.cover,
                ),
              ),
              // arrow_back icon
              Container(
                  padding: const EdgeInsets.only(left: 20, top: 30),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 15,
                    ),
                  )),
              // white container with overlay
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 20, top: 230),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(255, 245, 241, 241),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 10))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // star col
                    Column(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 250, 213, 5),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          rating != null ? rating + "/10" : "8/10",
                          style: const TextStyle(fontSize: 11),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          ratingcount != null ? ratingcount : "ratecount",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 9),
                        )
                      ],
                    ),
                    // rate and reviews col
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              height: .5),
                        )
                      ],
                    ),
                    // metascore col
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 2, bottom: 2),
                          color: const Color.fromARGB(255, 95, 196, 98),
                          child: const Text(
                            "86",
                            style: TextStyle(color: Colors.white, fontSize: 8),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const Text(
                          "Metascore",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "62 critic reviews",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(children: [
                // title, year, rated, time, add-to-watchlist
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: const EdgeInsets.only(top: 2),
                              child: Text(title,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20))),
                          Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Row(
                                children: [
                                  Text(
                                    release,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  const Text(
                                    "PH-13",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    streamtime != null
                                        ? streamtime
                                        : "no streamtime",
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              )),
                        ],
                      ),
                      // add to watchlist button
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: CustomColors.secColor,
                            border:
                                Border.all(color: CustomColors.outlineColor),
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
                const SizedBox(
                  height: 20,
                ),

                //genre
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            // color: CustomColors.secColor,
                            border:
                                Border.all(color: CustomColors.outlineColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: const Text(
                          "Action",
                          style: TextStyle(fontSize: 13),
                        ),
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
                            border:
                                Border.all(color: CustomColors.outlineColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: const Text(
                          "Biography",
                          style: TextStyle(fontSize: 13),
                        ),
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
                            border:
                                Border.all(color: CustomColors.outlineColor),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15))),
                        child: const Text(
                          "Drama",
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),

            // plot summary
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Plot Summary",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    summary != null
                        ? summary
                        : "summary not availabe for this movie",
                    style: const TextStyle(
                        color: Colors.grey, fontSize: 11, height: 1.5),
                  ),
                ],
              ),
            ),

            // cast and crew
            Container(
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
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
                                  AssetImage('assets/images/mangold.jpg'),
                              radius: 27,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'James',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Mangold',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 5,
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
                                  AssetImage('assets/images/damon.jpg'),
                              radius: 27,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Matt',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Damon',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 5,
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
                                  AssetImage('assets/images/bale.jpg'),
                              radius: 27,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Christian',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Bale',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 5,
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
                                  AssetImage('assets/images/katriona.jpg'),
                              radius: 27,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Caitriona',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              'Balfe',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Mollie',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11),
                            ),
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
