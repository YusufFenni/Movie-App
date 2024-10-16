import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp/constant/constants.dart';
import 'package:movieapp/moviedetail/view/movie_detail.dart';
import 'package:movieapp/service/model/movie_hive_model.dart';
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
      body: ValueListenableBuilder(
        valueListenable: Hive.box<MovieHive>('favorites').listenable(),
        builder: (context, Box<MovieHive> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text(
                'No favorite movies',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              var movieHive = box.getAt(index);
              if (movieHive == null) {
                return const SizedBox();
              }

              return Dismissible(
                key: Key(movieHive.id.toString()),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                onDismissed: (direction) async {
                  await box.deleteAt(index);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              '${movieHive.title} removed from favorites')),
                    );
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetail(
                          movie: Movie(
                            id: movieHive.id,
                            title: movieHive.title,
                            posterPath: movieHive.posterPath,
                            backdropPath: movieHive.backdropPath,
                            overview: movieHive.overview,
                            voteAverage: movieHive.voteAverage,
                            genre: movieHive.genre,
                            releaseDate: movieHive.releaseDate,
                            runtime: movieHive.runtime,
                            castList: [],
                          ),
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 16.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500/${movieHive.posterPath}',
                            width: 80,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        16.horizontalSpace,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              30.verticalSpace,
                              Text(
                                movieHive.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${movieHive.voteAverage}',
                                    style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
