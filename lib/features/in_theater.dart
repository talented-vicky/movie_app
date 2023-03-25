import 'package:flutter/material.dart';

class InTheater extends StatelessWidget {
  final List intheater;
  // expecting to recieve a list (we'll pass list from movie_api into in_theater)
  const InTheater({super.key, required this.intheater});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: intheater.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // /
            },
            child: Container(
              width: 240,
              child: Column(
                children: [
                  // movie image
                  Container(
                    height: 310,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/w500" +
                                    intheater[index]['poster_path']))),
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
                                  ? intheater[index]['vote_average'].toString()
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
      ),
    );
  }
}
