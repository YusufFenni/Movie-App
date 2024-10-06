import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movieapp/constant/constants.dart';
import 'package:movieapp/home/model/home_view_model.dart';
import 'package:movieapp/home/view/home_view.dart';
import 'package:movieapp/service/model/cast_hive_model.dart';
import 'package:movieapp/service/model/movie_hive_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  await Hive.initFlutter();
  Hive.registerAdapter(MovieHiveAdapter()); 
  Hive.registerAdapter(CastHiveAdapter());
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
            home: const HomeView(),
          );
        },
      ),
    );
  }
}
