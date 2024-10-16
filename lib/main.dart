import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp/constant/constants.dart';
import 'package:movieapp/home/model/home_view_model.dart';
import 'package:movieapp/home/view/home_view.dart';
import 'package:movieapp/favorite/view/favorite_movie_page.dart';
import 'package:movieapp/moviedetail/view/movie_detail.dart';
import 'package:movieapp/search/view/search_view.dart';
import 'package:movieapp/service/model/movie_hive_model.dart';
import 'package:movieapp/service/model/movie_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieHiveAdapter());
  await Hive.openBox<MovieHive>('favorites');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: ColorConstants.backGround,
              scaffoldBackgroundColor: ColorConstants.backGround,
            ),
            initialRoute: '/',
            routes: {
              '/': (context) => const HomeView(),
              '/favorites': (context) => const FavoriteMoviesPage(),
              '/search': (context) => const SearchView(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == '/movieDetail') {
                final movie = settings.arguments as Movie;
                return MaterialPageRoute(
                  builder: (context) => MovieDetail(movie: movie),
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
