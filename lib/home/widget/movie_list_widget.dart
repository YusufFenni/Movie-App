import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/home/model/home_view_model.dart';
import 'package:movieapp/moviedetail/view/movie_detail.dart';
import 'package:provider/provider.dart';

class MovieListView extends StatelessWidget {
  const MovieListView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    if (homeViewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 20.h,
          childAspectRatio: 0.7,
        ),
        itemCount: homeViewModel.currentMovies.length,
        itemBuilder: (context, index) {
          final movie = homeViewModel.currentMovies[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MovieDetail(movie: movie), // Detay sayfasına yönlendir
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -8.h,
                  left: -2.w,
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 45.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 4.0,
                          color: Colors.black,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
