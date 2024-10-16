import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/home/model/home_view_model.dart';
import 'package:movieapp/home/widget/category_name_widget.dart';
import 'package:movieapp/home/widget/movie_list_widget.dart';
import 'package:provider/provider.dart';

class CategoryMovieWidget extends StatelessWidget {
  const CategoryMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<HomeViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        26.verticalSpace,
        CategoryNameWidget(categoryProvider: categoryProvider),
        16.verticalSpace,
        const MovieListWidget(),
      ],
    );
  }
}

