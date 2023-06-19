import 'package:flutter/material.dart';

import '../utils/widgets/mini_place.dart';

class BoxOffice extends StatelessWidget {
  final List boxoffice;
  const BoxOffice({super.key, required this.boxoffice});

  @override
  Widget build(BuildContext context) {
    return MiniPlace(
      miniplace: boxoffice,
      text: "Box Office",
    );
  }
}
