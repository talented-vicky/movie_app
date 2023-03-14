import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../services/movie_services.dart';

class MovieAPIPage extends StatelessWidget {
  static const routeName = '/movie_api_page';
  const MovieAPIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie API Page"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // return FutureBuilder<List<MovieData>>(
    return FutureBuilder<MovieData>(
      future: MovieService().getMovie(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }
        if (!snapshot.hasData) {
          return const Center(child: Text("get() returns null!"));
        }
        final data = snapshot.data as MovieData; // cast to MovieData

        return Container(
          padding: const EdgeInsets.all(10),
          color: Colors.grey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Field1"),
                  Text(data.field1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Field2"),
                  Text(data.field2),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
