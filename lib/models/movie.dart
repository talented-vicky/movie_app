// import 'dart:convert';

// List<MoviePost> moviePostFromJson(String str) =>
//     List<MoviePost>.from(json.decode(str).map((x) => MoviePost.fromJson(x)));

// String moviePosttoJson(List<MoviePost> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieData {
  // MovieData({
  //   required this.reviews,
  //   required this.title,
  //   required this.year,
  //   required this.rating,
  //   required this.genre,
  //   required this.plotsummary,
  //   this.castcrew,
  // });

  // String reviews;
  // String title;
  // int year;
  // int rating;
  // String genre;
  // String plotsummary;
  // String? castcrew;

  final String field1;
  final String field2;

  const MovieData({
    this.field1 = '',
    this.field2 = '',
  });

  // factory MovieData.fromJson(Map<String, dynamic> json) => MovieData(
  //       title: json['title'],
  //       year: json['year'],
  //       rating: json['rating'],
  //       genre: json['genre'],
  //     );
  // Map<String, dynamic>(json) => {
  //       'title': title,
  //       'year': year,
  //       'rating': rating,
  //       'genre': genre,
  //     };

  factory MovieData.fromJson(Map<String, dynamic> json) =>
      _$MovieDataFromJson(json);
}

MovieData _$MovieDataFromJson(Map<String, dynamic> json) => MovieData(
      field1: json['field1'] as String? ?? '',
      field2: json['field2'] as String? ?? '',
    );
