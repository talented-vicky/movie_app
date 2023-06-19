import 'package:flutter/material.dart';

import '../utils/constants/custom_colors.dart';

class MovieAPIPage extends StatelessWidget {
  final String bannerurl,
      rating,
      ratingcount,
      title,
      release,
      streamtime,
      summary;
  const MovieAPIPage(
      {Key? key,
      required this.bannerurl,
      required this.rating,
      required this.ratingcount,
      required this.title,
      required this.release,
      required this.streamtime,
      required this.summary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List genre = ["Action", "Biography", "Drama"];
    final List<Map<dynamic, String>> castInfo = [
      {"name": "James Mangold", "role": "Director", "imageName": "mangold.jpg"},
      {"name": "Matt Damon", "role": "Carroll", "imageName": "damon.jpg"},
      {"name": "Vamp Dammie", "role": "Swiss Lord", "imageName": "damon.jpg"},
      {"name": "Christian Bale", "role": "Ken Miles", "imageName": "bale.jpg"},
      {"name": "Ford Cliff", "role": "Myles", "imageName": "ford.jpg"},
      {"name": "Caitry Balfe", "role": "Mollie", "imageName": "katriona.jpg"},
    ];
    return Scaffold(
        backgroundColor: CustomColors.backColor,
        body: SingleChildScrollView(
            child: Column(children: [
          Stack(children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(30)),
                child: Image.network(bannerurl, fit: BoxFit.cover)),
            Container(
                padding: const EdgeInsets.only(left: 20, top: 30),
                child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: Colors.black, size: 15))),
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
                      Column(children: [
                        const Icon(Icons.star,
                            color: Color.fromARGB(255, 250, 213, 5)),
                        const SizedBox(height: 4),
                        Text("$rating / 10",
                            style: const TextStyle(fontSize: 11)),
                        const SizedBox(height: 3),
                        Text(ratingcount,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 9))
                      ]),
                      Column(children: [
                        IconButton(
                            icon: const Icon(Icons.star_border_rounded),
                            color: const Color.fromARGB(255, 8, 8, 8),
                            onPressed: () {
                              //typically show a page to implement ratings increase
                            }),
                        const Text("Rate This",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 11,
                                height: .5))
                      ]),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                padding: const EdgeInsets.only(
                                    left: 5, right: 5, top: 2, bottom: 2),
                                color: const Color.fromARGB(255, 95, 196, 98),
                                child: const Text("86",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 8))),
                            const SizedBox(height: 7),
                            const Text("Metascore",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 10)),
                            const SizedBox(height: 5),
                            const Text("62 critic reviews",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10))
                          ])
                    ]))
          ]),
          Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
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
                                    child: Row(children: [
                                      Text(release,
                                          style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12)),
                                      const SizedBox(width: 15),
                                      const Text("PH-13",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12)),
                                      const SizedBox(width: 15),
                                      Text(streamtime,
                                          style: const TextStyle(
                                              color: Colors.grey, fontSize: 12))
                                    ]))
                              ]),
                          Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: CustomColors.secColor,
                                  border: Border.all(
                                      color: CustomColors.outlineColor),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15))),
                              child: const Icon(Icons.add,
                                  color: CustomColors.backColor, size: 18))
                        ])),
                    const SizedBox(height: 20),
                    Container(
                        height: 30,
                        child: ListView.builder(
                            itemCount: genre.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, ind) => Row(children: [
                                  Container(
                                      alignment: Alignment.center,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: CustomColors.outlineColor),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(15))),
                                      child: Text(genre[ind],
                                          style:
                                              const TextStyle(fontSize: 13))),
                                  const SizedBox(width: 12),
                                ]))),
                    const SizedBox(height: 10),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Plot Summary",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15))),
                    Text(summary,
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 11, height: 1.5)),
                    const SizedBox(height: 20),
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Cast & Crew",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15))),
                    const SizedBox(height: 15),
                    Container(
                        height: 100,
                        child: ListView.builder(
                            itemCount: castInfo.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int ind) {
                              return Row(children: [
                                Column(children: [
                                  CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/${castInfo[ind]["imageName"]}"),
                                      radius: 27),
                                  const SizedBox(height: 8),
                                  Text(castInfo[ind]["name"].toString(),
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11)),
                                  const SizedBox(height: 5),
                                  Text(castInfo[ind]["role"].toString(),
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11))
                                ]),
                                const SizedBox(width: 35)
                              ]);
                            }))
                  ])),
        ])));
  }
}
