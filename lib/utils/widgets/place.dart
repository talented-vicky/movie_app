import 'package:flutter/material.dart';

import '../../views/movie_info.dart';

class Place extends StatelessWidget {
  final List place;
  const Place({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        child: ListView.builder(
            itemCount: place.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieAPIPage(
                                title: place[index]['name'].toString(),
                                bannerurl:
                                    "https://image.tmdb.org/t/p/w500${place[index]['backdrop_path']}",
                                rating: place[index]['vote_average'].toString(),
                                ratingcount:
                                    place[index]['vote_count'].toString(),
                                release: place[index]['first_air_date'],
                                streamtime:
                                    place[index]['popularity'].toString(),
                                summary: place[index]['overview'])));
                  },
                  child: Container(
                      width: 330,
                      child: Column(children: [
                        ClipRRect(
                          child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 330,
                              width: 220,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://image.tmdb.org/t/p/w500${place[index]['poster_path']}"),
                                      fit: BoxFit.cover))),
                        ),
                        const SizedBox(height: 30),
                        Text(place[index]['name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black)),
                        const SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.star,
                                  color: Color.fromARGB(255, 250, 213, 5),
                                  size: 12),
                              const SizedBox(width: 5),
                              Text(place[index]['vote_average'].toString(),
                                  style: const TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w200))
                            ])
                      ])));
            }));
  }
}
