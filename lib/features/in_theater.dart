import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:movie_app/constants/custom_colors.dart';
import 'package:movie_app/features/movie_info.dart';

class InTheater extends StatelessWidget {
  final List intheater;
  // expecting to recieve a list (we'll pass list from movie_api into in_theater)
  const InTheater({super.key, required this.intheater});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        child: ListView.builder(
          itemCount: intheater.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieAPIPage(
                            title: intheater[index]['name'].toString(),
                            bannerurl: "https://image.tmdb.org/t/p/w500" +
                                intheater[index]['backdrop_path'],
                            rating: intheater[index]['vote_average'].toString(),
                            ratingcount:
                                intheater[index]['vote_count'].toString(),
                            release: intheater[index]['first_air_date'],
                            streamtime:
                                intheater[index]['popularity'].toString(),
                            summary: intheater[index]['overview'])));
              },
              child: Container(
                width: 330,
                child: Column(
                  children: [
                    // movie image
                    ClipRRect(
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 330,
                        width: 220,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500" +
                                        intheater[index]['poster_path']),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // star, rating number
                    Container(
                      child: Column(
                        children: [
                          Text(
                            intheater[index]['name'] != null
                                ? intheater[index]['name']
                                : 'Title Loading',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color.fromARGB(255, 250, 213, 5),
                                size: 12,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                intheater[index]['vote_average'] != null
                                    ? intheater[index]['vote_average']
                                        .toString()
                                    : "8.2",
                                style: const TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w200),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
