import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/constant/constants.dart';
import 'package:movieapp/search/view/search_view.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchView()),
          );
        },
        child: Container(
          width: 326.w,
          height: 42.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: ColorConstants.search),
          child: Row(
            children: [
              20.horizontalSpace,
              const Text(
                StringConstants.search,
                style: TextStyle(color: Colors.white30),
              ),
              const Spacer(),
              const Icon(
                Icons.search,
                color: Colors.white30,
              ),
              20.horizontalSpace
            ],
          ),
        ),
      ),
    );
  }
}
