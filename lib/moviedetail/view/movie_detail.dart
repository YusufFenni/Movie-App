import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movieapp/service/model/movie_model.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;

  const MovieDetail({super.key, required this.movie});

  Future<void> saveMovieToFavorites() async {
    var box = await Hive.openBox<Movie>('favorites');
    await box.add(movie);
  } // modeli kaydetcen 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'Detail',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border, color: Colors.white),
            onPressed: () async {
              await saveMovieToFavorites();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Movie saved to favorites!')),
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      width: 100.w,
                      height: 150.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                size: 16, color: Colors.grey),
                            SizedBox(width: 4.w),
                            Text(
                              movie.releaseDate.year.toString(),
                              style: const TextStyle(color: Colors.grey),
                            ),
                            SizedBox(width: 16.w),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    size: 16, color: Colors.orange),
                                SizedBox(width: 4.w),
                                Text(
                                  '${movie.voteAverage}',
                                  style: const TextStyle(color: Colors.orange),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const Text(
                'About Movie',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                movie.overview,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16.h),
              const Text(
                'Cast',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                height:
                    150.h, 
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movie.castList.length,
                  itemBuilder: (context, index) {
                    final cast = movie.castList[index];
                    return Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.network(
                              cast.profilePath.isNotEmpty
                                  ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
                                  : 'https://via.placeholder.com/80x100',
                              width: 80.w,
                              height: 100.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            cast.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            cast.character,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.sp,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF1A1A1A), 
    );
  }
}
