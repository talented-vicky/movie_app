import 'package:flutter/material.dart';

import '../utils/widgets/mini_place.dart';

class Community extends StatelessWidget {
  final List community;
  const Community({super.key, required this.community});

  @override
  Widget build(BuildContext context) {
    return MiniPlace(
      miniplace: community,
      text: "Community",
    );
  }
}
