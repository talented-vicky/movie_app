import 'package:flutter/material.dart';
import 'package:movie_app/features/movie_api.dart';
import 'package:movie_app/models/movie.dart';

import '../constants/custom_colors.dart';
import '../services/movie_services.dart';

class InTheater extends StatefulWidget {
  const InTheater({super.key});

  @override
  State<InTheater> createState() => _InTheaterState();
}

class _InTheaterState extends State<InTheater> {
  static const List _genre = [
    "Action",
    "Drama",
    "Adventure",
    "Thriller",
    "Horror",
    "Sci-fi",
    "Romance",
    "Comedy",
    "Fantasy",
    "Mystery",
    "Suspense"
  ];

  static const List _findMovies = [
    "In Theater",
    "Box Office",
    "Community",
    "Netflix",
    "IMDB"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColors.backColor,
        leading: const Icon(
          Icons.menu_open,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
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
                      children: const [
                        Text(
                          "In Theater",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          "Box Office",
                          style: TextStyle(
                              color: CustomColors.unselectedNavBarColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
                          "Community View",
                          style: TextStyle(
                              color: CustomColors.unselectedNavBarColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          width: 100,
                        ),
                        Text(
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
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(_genre.length, (int ind) {
                          return Card(
                              // color: Colors.green,
                              child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: CustomColors.outlineColor),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            child: Container(
                              width: 80.0,
                              height: 80.0,
                              child: Text(
                                _genre[ind],
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ));
                        }),
                      )),
                ],
              ),
            ),
            // movie image
            Container(
              alignment: Alignment.center,
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: CustomColors.outlineColor),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Image.asset(
                "assets/images/fordVferrari.png",
              ),
            ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.star,
                          color: Color.fromARGB(255, 255, 232, 20)),
                      SizedBox(
                        width: 5,
                      ),
                      Text("8.2")
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
