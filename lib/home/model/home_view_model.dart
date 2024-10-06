import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movieapp/service/model/movie_model.dart';
import 'package:movieapp/service/service/movie_service.dart';

class HomeViewModel with ChangeNotifier {
  final MovieService _movieService = MovieService();
  int _selectedIndex = 0;
  bool _isLoading = true;
  List<Movie> _currentMovies = [];
  List<Movie> _filteredMovies = []; // Arama için filtrelenmiş liste

  final List<String> categories = [
    "New Added",
    "Horror",
    "Income",
    "Comedy",
    "Action"
  ];

  final Map<String, String> tmdbCategories = {
    "New Added": "now_playing",
    "Horror": "horror",
    "Income": "top_rated",
    "Comedy": "popular",
    "Action": "upcoming",
  };

  int get selectedIndex => _selectedIndex;
  bool get isLoading => _isLoading;
  List<Movie> get currentMovies => _currentMovies;
  List<Movie> get filteredMovies => _filteredMovies; // Arama sonuçları

  HomeViewModel() {
    fetchMovies();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    fetchMovies();
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();
    try {
      final tmdbCategory = tmdbCategories[categories[_selectedIndex]];
      if (tmdbCategory != null) {
        _currentMovies = await _movieService.fetchMovies(tmdbCategory);
        _filteredMovies = _currentMovies; // Varsayılan olarak tüm filmler
      } else {
        log('Invalid category selected');
      }
    } catch (e) {
      log('Error fetching movies: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Arama fonksiyonu
  void searchMovies(String query) {
    if (query.isEmpty) {
      _filteredMovies = _currentMovies; // Eğer sorgu boşsa, tüm filmleri göster
    } else {
      _filteredMovies = _currentMovies
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
