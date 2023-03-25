// import 'package:flutter/material.dart';
// import 'package:movie_app/main.dart';
// import 'package:movie_app/features/in_theater.dart';
// import 'package:movie_app/features/box_office.dart';
// import 'package:movie_app/features/community.dart';

// import 'features/movie_info.dart';

// // Route<dynamic> generateRoute(RouteSettings routeSettings) {
// Route? generateRoute(RouteSettings routeSettings) {
//   switch (routeSettings.name) {
//     case MyApp.routeName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (context) => const MyApp(),
//       );
//     case MovieAPIPage.routeName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (context) => const MovieAPIPage(),
//       );
//     case Community.routeName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (BuildContext context) => Community(
//           community: [],
//         ),
//       );
//     case BoxOffice.routeName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (context) => const BoxOffice(
//           boxoffice: [],
//         ),
//       );
//     case InTheater.routeName:
//       return MaterialPageRoute(
//         settings: routeSettings,
//         builder: (context) => const InTheater(
//           intheater: [],
//         ),
//       );
//     default:
//       return MaterialPageRoute(
//           settings: routeSettings,
//           builder: (context) => const Scaffold(
//                 body: Center(child: Text("Oops! Bad page")),
//               ));
//   }
// }

// Route routeNotGenerated(RouteSettings settings) {
//   return MaterialPageRoute<void>(
//     settings: settings,
//     builder: (BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Oops!'),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: Center(
//           child: Text(
//             'Page Not Implemented',
//             textAlign: TextAlign.center,
//             style: Theme.of(context).textTheme.headline6,
//           ),
//         ),
//       );
//     },
//   );
// }
