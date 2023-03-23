/*
IMPORTANT

*** fix drop shadow for image on in_theater page
*** push to github and continue on api fetch from tmdb
 */

import 'package:tmdb_api/tmdb_api.dart';

import 'package:flutter/material.dart';
// import 'package:cupertino_icons/cupertino_icons.dart';

import 'package:movie_app/features/movie_info.dart';
// import 'package:movie_app/models/movie.dart';

import '../constants/custom_colors.dart';
// import '../services/movie_services.dart';

class InTheater extends StatefulWidget {
  InTheater({super.key});

  @override
  State<InTheater> createState() => _InTheaterState();
}

class _InTheaterState extends State<InTheater> {
  List _moviestv = [];

  final String _apikey = "f36387f52cc0e30cd5ad94e240fddfdd";
  final String _accesstoken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMzYzODdmNTJjYzBlMzBjZDVhZDk0ZTI0MGZkZGZkZCIsInN1YiI6IjY0MTQyMDJjZWRlMWIwMjhlODRlN2UzMCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.56Pk05uljr-DiLl5wgAqx9seOYsWNorQhvqLOGwPV6I";

  @override
  void initState() {
    getMovies();
    super.initState();
  }

  getMovies() async {
    TMDB tmdbWithLogs = TMDB(ApiKeys(_apikey, _accesstoken),
        logConfig: ConfigLogger(showErrorLogs: true, showLogs: true));

    Map intheater = await tmdbWithLogs.v3.tv.getPouplar();
    setState(() {
      _moviestv = intheater['results'];
    });
    print(_moviestv);
  }

  static const List _genre = [
    "Action",
    "Crime",
    "Comedy",
    "Drama",
    "Adventure",
    "Thriller",
    "Horror",
    "Sci-fi",
    "Romance",
    "Fantasy",
    "Mystery",
    "Suspense"
  ];

  // static const List _findMovies = [
  //   "In Theater",
  //   "Box Office",
  //   "Community",
  //   "Netflix",
  //   "IMDB"
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.backColor,
        leading: Container(
          margin: const EdgeInsets.only(left: 20, top: 30),
          child: const Icon(
            Icons.menu_sharp,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 30),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
          )
        ],
      ),
      // backgroundColor: CustomColors.backColor,
      backgroundColor: CustomColors.backColor,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // find movies and genre
            Container(
              child: Column(
                children: [
                  // find movies in:
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20),
                    height: 60,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              child: const Text(
                                "In Theater",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                              width: 15,
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                icon: const Icon(
                                  Icons.remove_outlined,
                                  size: 50,
                                ),
                                color: Colors.red,
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        const Text(
                          "Box Office",
                          style: TextStyle(
                              color: CustomColors.unselectedNavBarColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        const Text(
                          "Community View",
                          style: TextStyle(
                              color: CustomColors.unselectedNavBarColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        const Text(
                          "Netflix",
                          style: TextStyle(
                              color: CustomColors.unselectedNavBarColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  // movie genre
                  Container(
                      margin: const EdgeInsets.only(left: 20, top: 20),
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(_genre.length, (int ind) {
                          return Card(
                              elevation: 0,
                              color: CustomColors.backColor,
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    constraints:
                                        const BoxConstraints(maxWidth: 90),
                                    decoration: BoxDecoration(
                                        // color: CustomColors.secColor,
                                        border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 192, 190, 190)),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(30))),
                                    child: Text(
                                      _genre[ind],
                                      textAlign: TextAlign.center,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ));
                        }),
                      )),
                ],
              ),
            ),
            // movie image
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  "assets/images/fordVferrari.png",
                )),
            // // movie details (API fetching)
            // Container(
            //   margin: const EdgeInsets.only(top: 5, bottom: 5),
            //   child: FutureBuilder<MovieData>(
            //     future: MovieService().getMovie(),
            //     builder: (BuildContext context, AsyncSnapshot snapshot) {
            //       if (snapshot.connectionState != ConnectionState.done) {
            //         return const Center(child: CircularProgressIndicator());
            //       }
            //       if (snapshot.hasError) {
            //         return Center(child: Text(snapshot.error.toString()));
            //       }
            //       if (!snapshot.hasData) {
            //         return const Center(
            //             child: Text("getMovie() returns null!"));
            //       }
            //       final data = snapshot.data as MovieData; // cast to MovieData

            //       return Container(
            //         padding: const EdgeInsets.all(10),
            //         color: Colors.grey,
            //         child: Column(
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 const Text("movie image cover"),
            //                 Text(data.field1),
            //               ],
            //             ),
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 const Text("title here"),
            //                 Text(data.field2),
            //               ],
            //             ),
            //             Container(
            //                 color: Colors.grey, child: const Text("ratings"))
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // movie image, title, rating
            Container(
              child: Column(
                children: [
                  const Text(
                    "Ford v Ferrari",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 250, 213, 5),
                        size: 12,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "8.2",
                        style: TextStyle(
                            fontSize: 11, fontWeight: FontWeight.w200),
                      )
                    ],
                  )
                ],
              ),
            ),

            // movie info navigation
            ElevatedButton(
              // onPressed: () => Navigator.pushNamed(context, '/movie_api_page'),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const MovieAPIPage())),
              child: const Text("Movie Info"),
            ),
          ],
        ),
      )),
    );
  }
}
