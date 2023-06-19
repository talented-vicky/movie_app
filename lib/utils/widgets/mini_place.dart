import 'package:flutter/material.dart';

import '../../utils/constants/custom_colors.dart';
import '../../views/movie_info.dart';

class MiniPlace extends StatelessWidget {
  final List miniplace;
  final String text;
  const MiniPlace({super.key, required this.miniplace, required this.text});

  static const List _genre = [
    "Action",
    "Crime",
    "Comedy",
    "Drama",
    "Adventure",
    "Thriller",
    "Horror"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: CustomColors.backColor,
            leading: Container(
                margin: const EdgeInsets.only(left: 20, top: 30),
                child: Container(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios_new,
                            size: 15, color: Colors.black)))),
            actions: [
              Container(
                  margin: const EdgeInsets.only(right: 20, top: 30),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      )))
            ]),
        backgroundColor: CustomColors.backColor,
        body: SafeArea(
            child: Container(
                margin: const EdgeInsets.only(top: 30, bottom: 30),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          child: Column(children: [
                        Container(
                            child: Text(text,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                        SizedBox(
                            height: 50,
                            width: 15,
                            child: Container(
                                alignment: Alignment.bottomLeft,
                                padding: const EdgeInsets.all(0),
                                child: const Icon(Icons.remove_outlined,
                                    size: 50, color: Colors.red))),
                        Container(
                            margin: const EdgeInsets.only(left: 20, top: 20),
                            height: 50,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children:
                                    List.generate(_genre.length, (int ind) {
                                  return Card(
                                      elevation: 0,
                                      color: CustomColors.backColor,
                                      child: Row(children: [
                                        Container(
                                            alignment: Alignment.center,
                                            height: 30,
                                            constraints: const BoxConstraints(
                                                maxWidth: 90),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 192, 190, 190)),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(30))),
                                            child: Text(_genre[ind],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.black))),
                                        const SizedBox(width: 10)
                                      ]));
                                })))
                      ])),
                      const SizedBox(height: 30),

                      // tmdb movie
                      Container(
                          height: 500,
                          child: ListView.builder(
                              itemCount: miniplace.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MovieAPIPage(
                                                  title: miniplace[index]
                                                          ['title']
                                                      .toString(),
                                                  bannerurl:
                                                      "https://image.tmdb.org/t/p/w500${miniplace[index]['backdrop_path']}",
                                                  rating: miniplace[index]
                                                          ['vote_average']
                                                      .toString(),
                                                  ratingcount: miniplace[index]
                                                          ['vote_count']
                                                      .toString(),
                                                  release: miniplace[index]
                                                      ['release_date'],
                                                  streamtime: miniplace[index]
                                                          ['popularity']
                                                      .toString(),
                                                  summary: miniplace[index]
                                                      ['overview'])));
                                    },
                                    child: Container(
                                        width: 330,
                                        child: Column(children: [
                                          // movie image
                                          ClipRRect(
                                              child: Container(
                                            margin: const EdgeInsets.all(10),
                                            height: 330,
                                            width: 220,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://image.tmdb.org/t/p/w500${miniplace[index]['poster_path']}"),
                                                    fit: BoxFit.cover)),
                                          )),
                                          const SizedBox(height: 30),
                                          Container(
                                              child: Column(children: [
                                            Text(miniplace[index]['title'],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.black)),
                                            const SizedBox(height: 10),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  const Icon(Icons.star,
                                                      color: Color.fromARGB(
                                                          255, 250, 213, 5),
                                                      size: 12),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                      miniplace[index]
                                                              ['vote_average']
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w200))
                                                ])
                                          ]))
                                        ])));
                              }))
                    ]))));
  }
}
