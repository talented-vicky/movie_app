import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../views/in_theater.dart';
import '../views/netflix.dart';
import '../views/community.dart';
import '../views/box_office.dart';
import '../utils/constants/custom_colors.dart';
import '../utils/constants/place_text.dart';

class MovieAPIService extends StatefulWidget {
  const MovieAPIService({super.key});

  @override
  State<MovieAPIService> createState() => _MovieAPIServiceState();
}

class _MovieAPIServiceState extends State<MovieAPIService> {
  late List netflixMov = [];
  late List intheaters = [];
  late List boxofficeMov = [];
  late List communityMov = [];

  final String _apikey = "f36387f52cc0e30cd5ad94e240fddfdd";
  final String _accesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMzYzODdmNTJjYzBlMzBjZDVhZDk0ZTI0MGZkZGZkZCIsInN1YiI6IjY0MTQyMDJjZWRlMWIwMjhlODRlN2UzMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.56Pk05uljr-DiLl5wgAqx9seOYsWNorQhvqLOGwPV6I";

  @override
  void initState() {
    getNetflix();
    super.initState();
  }

  getNetflix() async {
    TMDB tmdbWithLogs = TMDB(ApiKeys(_apikey, _accesstoken),
        logConfig: ConfigLogger(showErrorLogs: true, showLogs: true));

    Map intheaterResult = await tmdbWithLogs.v3.tv.getPouplar();
    Map boxofficeResult = await tmdbWithLogs.v3.discover.getMovies();
    Map communityResult = await tmdbWithLogs.v3.discover.getTvShows();
    Map netflixResult = await tmdbWithLogs.v3.movies.getTopRated();
    print(communityResult);

    setState(() {
      intheaters = intheaterResult['results'];
      boxofficeMov = boxofficeResult['results'];
      communityMov = communityResult['results'];
      netflixMov = netflixResult['results'];
    });
    print(communityMov);
  }

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
              child: const Icon(Icons.menu_sharp, color: Colors.black),
            ),
            actions: [
              Container(
                  margin: const EdgeInsets.only(right: 20, top: 30),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.black)))
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
                            margin: const EdgeInsets.only(top: 20, left: 20),
                            height: 60,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const PlaceText(
                                            text: "In Theater",
                                            color: Colors.black),
                                        SizedBox(
                                            height: 10,
                                            width: 15,
                                            child: IconButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                icon: const Icon(
                                                    Icons.remove_outlined,
                                                    size: 50),
                                                color: Colors.red,
                                                onPressed: () {}))
                                      ]),
                                  const SizedBox(width: 100),
                                  GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  BoxOffice(
                                                      boxoffice:
                                                          boxofficeMov))),
                                      child: const PlaceText(
                                          text: "Box Office",
                                          color: CustomColors
                                              .unselectedNavBarColor)),
                                  const SizedBox(width: 100),
                                  GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Community(
                                                      community:
                                                          communityMov))),
                                      child: const PlaceText(
                                          text: "Community View",
                                          color: CustomColors
                                              .unselectedNavBarColor)),
                                  const SizedBox(width: 100),
                                  GestureDetector(
                                      onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  Netflix(
                                                      netflix: netflixMov))),
                                      child: const PlaceText(
                                          text: "Netflix",
                                          color: CustomColors
                                              .unselectedNavBarColor))
                                ])),
                        // movie genre
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
                                                // color: CustomColors.secColor,
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
                      // movies from tmdb
                      Container(
                        height: 450,
                        child: ListView(
                            children: [InTheater(intheater: intheaters)]),
                      )
                    ]))));
  }
}
