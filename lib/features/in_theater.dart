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
                              // constraints: const BoxConstraints(maxWidth: 50),
                              // decoration: BoxDecoration(
                              //     // color: CustomColors.secColor,
                              //     border: Border.all(
                              //         color: CustomColors.outlineColor),
                              //     borderRadius: const BorderRadius.all(
                              //         Radius.circular(55))),
                              child: IconButton(
                                padding: const EdgeInsets.all(0),
                                // icon: Icons.remove_outlined,
                                icon: const Icon(
                                  Icons.remove_outlined,
                                  size: 50,
                                ),
                                color: Colors.red,
                                onPressed: () {},
                                // size: ,
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
                                            color: CustomColors.outlineColor),
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
                child: Image.asset(
                  "assets/images/fordVferrari.png",
                ),
                borderRadius: BorderRadius.circular(50)),
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
