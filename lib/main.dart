import 'package:flutter/material.dart';
import 'package:islami_app/ul/home_screen.dart';
import 'package:islami_app/ul/tabBodyHomeScreen/tabHadith/hadith_detail.dart';
import 'package:islami_app/util/app_route.dart';
import 'package:islami_app/util/app_theme.dart';
import 'package:islami_app/util/launch_service.dart';

import 'ul/introduction_screen.dart';
import 'ul/tabBodyHomeScreen/tabQuran/sara_screen.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final isFirst = await AppLaunchService.isFirstLaunch();
  runApp( MyApp(isFirstLaunch: isFirst,));
}

class MyApp extends StatelessWidget {
bool isFirstLaunch;
   MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme:  AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoute.homeScreenRoute:(context) => HomeScreen(),
        AppRoute.introductionScreenRoute:(context) => IntroductionScreens(),
        AppRoute.SaraScreenRoute:(context) => SaraScreen(),
        AppRoute.hadithScreenRoute:(context) => HadithDetail(),
      },
      initialRoute:isFirstLaunch
          ? AppRoute.introductionScreenRoute
          : AppRoute.homeScreenRoute,
      //   initialRoute:AppRoute.homeScreenRoute,
    );
  }
}

