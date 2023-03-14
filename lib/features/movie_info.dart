// import 'package:flutter/material.dart';

// class MovieInfo extends StatelessWidget {
//   const MovieInfo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Movie Information',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       initialRoute: '/',
//       onGenerateRoute: (settings) => onGenerateRoute(settings),
//       onUnknownRoute: pageNotImplementedRoute,
//     );
//   }

//   Route? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case '/':
//         return MaterialPageRoute(
//           builder: (context) => const MyHomePage(),
//         );

//       case '/api_page':
//         return MaterialPageRoute(
//           builder: (context) => const MyAPIPage(),
//         );

//       default:
//         return null;
//     }
//   }

//   Route pageNotImplementedRoute(RouteSettings settings) {
//     return MaterialPageRoute<void>(
//       settings: settings,
//       builder: (BuildContext context) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text('Oops!'),
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ),
//           body: Center(
//             child: Text(
//               'Page Not Implemented',
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.headline6,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home Page"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => Navigator.pushNamed(context, '/api_page'),
//           child: const Text("Call API"),
//         ),
//       ),
//     );
//   }
// }

// class MyAPIPage extends StatelessWidget {
//   const MyAPIPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("API Page"),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildBody() {
//     return FutureBuilder<MyData>(
//       future: APIService().get(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState != ConnectionState.done) {
//           return const Center(child: CircularProgressIndicator());
//         }
//         if (snapshot.hasError) {
//           return Center(child: Text(snapshot.error.toString()));
//         }
//         if (!snapshot.hasData) {
//           return const Center(child: Text("get() returns null!"));
//         }
//         final data = snapshot.data as MyData; // cast to MyData
//         return Container(
//           padding: const EdgeInsets.all(10),
//           color: Colors.grey,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Field1"),
//                   Text(data.field1),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Field2"),
//                   Text(data.field2),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class APIService {
//   static const _authority = "sameer-kumar-aztro-v1.p.rapidapi.com";
//   static const _path = "/";
//   static const _query = {"sign": "aquarius", "day": "today"};
//   static const Map<String, String> _headers = {
//     "x-rapidapi-key": "*****************",
//     "x-rapidapi-host": "sameer-kumar-aztro-v1.p.rapidapi.com",
//   };

//   // Base API request to get response
//   Future<MyData> get() async {
//     Uri uri = Uri.https(_authority, _path, _query);
//     final response = await http.get(uri, headers: _headers);
//     if (response.statusCode == HttpStatus.ok) {
//       // If server returns an OK response, parse the JSON.
//       final jsonMap = json.decode(response.body);
//       return MyData.fromJson(jsonMap);
//     } else {
//       // If that response was not OK, throw an error.
//       throw Exception('API call returned: ${response.statusCode} ${response.reasonPhrase}');
//     }
//   }
// }

// class MyData {
//   final String field1;
//   final String field2;

//   const MyData({
//     this.field1 = '',
//     this.field2 = '',
//   });

//   factory MyData.fromJson(Map<String, dynamic> json) => _$MyDataFromJson(json);
// }

// MyData _$MyDataFromJson(Map<String, dynamic> json) => MyData(
//       field1: json['field1'] as String? ?? '',
//       field2: json['field2'] as String? ?? '',
//     );