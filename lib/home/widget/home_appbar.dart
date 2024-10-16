import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/constant/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        StringConstants.homeText,
        style: TextStyle(fontSize: 24.sp, color: Colors.white),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/favorites');
          },
          icon: Icon(
            Icons.star,
            size: 24.sp,
            color: Colors.amberAccent,
          ),
        ),
        18.horizontalSpace,
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
