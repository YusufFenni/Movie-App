import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/constant/constants.dart';
import 'package:movieapp/favorite/view/favorite_movie_page.dart';

class HomeTextWidget extends StatelessWidget {
  const HomeTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Row(
        children: [
          Text(
            StringConstants.homeText,
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
            textAlign: TextAlign.left,
          ),
          18.horizontalSpace,
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) =>
                //         const FavoriteMoviesPage(), // Detay sayfasına yönlendir
                //   ),
                // );
              },
              icon: Icon(
                Icons.star,
                size: 24.sp,
                color: Colors.amberAccent,
              ))
        ],
      ),
    );
  }
}
