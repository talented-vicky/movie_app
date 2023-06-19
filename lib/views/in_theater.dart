import 'package:flutter/material.dart';

import '../views/movie_info.dart';

import '../utils/widgets/place.dart';

class InTheater extends StatelessWidget {
  final List intheater;
  const InTheater({super.key, required this.intheater});

  @override
  Widget build(BuildContext context) {
    return Place(place: intheater);
  }
}
