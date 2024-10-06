import 'package:flutter/material.dart';
import 'package:movieapp/constant/constants.dart';
import 'package:movieapp/home/model/home_view_model.dart';
import 'package:movieapp/search/widget/searc_view_widget.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.backGround,
        title: const Text(
          StringConstants.search,
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SearchPageWidget(homeViewModel: homeViewModel),
      ),
    );
  }
}
