import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/constant/constants.dart';
import 'package:movieapp/home/model/home_view_model.dart';
import 'package:movieapp/search/widget/movie_search_result_list.dart';

class SearchPageWidget extends StatelessWidget {
  const SearchPageWidget({
    super.key,
    required this.homeViewModel,
  });

  final HomeViewModel homeViewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.white),
            filled: true,
            fillColor: ColorConstants.search,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none,
            ),
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
          ),
          onSubmitted: (query) {
            if (query.isNotEmpty) {
              homeViewModel.searchMovies(query);
            }
          },
        ),
       16.verticalSpace,
        homeViewModel.isLoading
            ? const CircularProgressIndicator()
            : homeViewModel.filteredMovies.isEmpty
                ? const Text('No movies found')
                : Expanded(
                    child: ListView.builder(
                      itemCount: homeViewModel.filteredMovies.length,
                      itemBuilder: (context, index) {
                        final movie = homeViewModel.filteredMovies[index];
                        return MovieSearchResultList(movie: movie);
                      },
                    ),
                  ),
      ],
    );
  }
}

