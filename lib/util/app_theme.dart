import 'package:flutter/material.dart';

import 'app_colors.dart';

 class AppTheme  {

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    fontFamily: 'Janna',
    appBarTheme:AppBarThemeData(
      backgroundColor: AppColors.darkGray,
       titleTextStyle: TextStyle(color:AppColors.gold ),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColors.gold
      )

    )
  );

}
