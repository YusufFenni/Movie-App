import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:movieapp/constant/constants.dart';
import 'package:movieapp/service/model/movie_model.dart';

class FavoriteMoviesPage extends StatelessWidget {
  const FavoriteMoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backGround,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Favorite Movies',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: Hive.openBox<Movie>('favorites'),
        builder: (context, AsyncSnapshot<Box<Movie>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Error opening favorites box',
                ),
              );
            } else {
              var box = snapshot.data;
              if (box != null && box.isNotEmpty) {
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    var movie = box.getAt(index);
                    return ListTile(
                      title: Text(movie?.title ?? 'Unknown'),
                      leading: Image.network(
                        'https://image.tmdb.org/t/p/w500${movie?.posterPath}',
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    'No favorite movies',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
