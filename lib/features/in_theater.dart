import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_open),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      backgroundColor: CustomColors.backColor,
      body: SafeArea(
          child: Column(
        children: [
          // find movies in:
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 60,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Text(
                  "In Theater",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Box Office",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Community",
                  style: TextStyle(fontSize: 20),
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
                        border: Border.all(color: CustomColors.outlineColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30))),
                    child: Container(
                      width: 80.0,
                      height: 50.0,
                      child: Text(
                        _genre[ind],
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ));
                }),
              )),
          // movie details
          Container(
            color: Colors.amberAccent,
            child: FutureBuilder<MovieData>(
              future: MovieService().getMovie(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                }
                if (!snapshot.hasData) {
                  return const Center(child: Text("getMovie() returns null!"));
                }
                final data = snapshot.data as MovieData; // cast to MovieData

                return Container(
                  padding: const EdgeInsets.all(10),
                  color: Colors.grey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("movie image cover"),
                          Text(data.field1),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("title here"),
                          Text(data.field2),
                        ],
                      ),
                      Container(
                          color: Colors.grey, child: const Text("ratings"))
                    ],
                  ),
                );
              },
            ),
          ),

          // movie info navigation
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/movie_api_page'),
            child: const Text("Movie Info"),
          ),
        ],
      )),
    );
  }
}
