import 'package:flutter/material.dart';

import '../utils/widgets/mini_place.dart';

class Netflix extends StatelessWidget {
  final List netflix;
  const Netflix({super.key, required this.netflix});

  @override
  Widget build(BuildContext context) {
    return MiniPlace(miniplace: netflix, text: "Netflix");
  }
}
