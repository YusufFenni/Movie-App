import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/home/model/home_view_model.dart';
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:
                List.generate(categoryProvider.categories.length, (index) {
              return GestureDetector(
                onTap: () {
                  categoryProvider
                      .setSelectedIndex(index);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    children: [
                      Text(
                        categoryProvider.categories[index],
                        style: TextStyle(
                          fontSize: 18.sp,
                          color: categoryProvider.selectedIndex == index
                              ? Colors.white
                              : Colors.white54,
                          fontWeight: categoryProvider.selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      if (categoryProvider.selectedIndex == index)
                        Container(
                          margin: EdgeInsets.only(top: 4.h),
                          height: 2.h,
                          width: 30.w,
                          color: Colors.white,
                        ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        16.verticalSpace,
        const MovieListView(),
      ],
    );
  }
}
