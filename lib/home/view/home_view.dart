import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/home/widget/category_movie_widget.dart';
import 'package:movieapp/home/widget/home_appbar.dart';
import 'package:movieapp/home/widget/search_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
