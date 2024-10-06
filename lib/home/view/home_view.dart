import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/home/widget/category_movie.dart';
import 'package:movieapp/home/widget/home_text.dart';
import 'package:movieapp/home/widget/search.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.verticalSpace,
            const HomeTextWidget(), // Appbar olcak 
            24.verticalSpace,
            const SearchWidget(),
            20.horizontalSpace,
            const CategoryMovieWidget(),
          ],
        ),
      ),
    );
  }
}
