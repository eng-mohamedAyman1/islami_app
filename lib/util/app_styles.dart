import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static final TextStyle base16BoldGold = TextStyle(
    fontSize: 16,
    color: AppColors.gold,
    fontWeight: FontWeight.w700,
  ); static final TextStyle base24BoldGold = TextStyle(
    fontSize: 24,
    color: AppColors.gold,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle base16BoldCreamyYellow = TextStyle(
    fontSize: 16,
    color: AppColors.creamyYellow,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle bold24DarkGray = TextStyle(
    fontSize: 24,
    color: AppColors.darkGray,
    fontWeight: FontWeight.w700,
  );
  static final TextStyle bold20White = TextStyle(
    fontSize: 20,
    color: AppColors.white,
    fontWeight: .w700,
  );static final TextStyle bold14White = TextStyle(
    fontSize: 14,
    color: AppColors.white,
    fontWeight: .w700,
  );static final TextStyle bold16White = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontWeight: .w700,
  );

  static final TextStyle description = TextStyle(
    fontSize: 20,
    color: AppColors.gold,
    fontWeight: .w700,
    height: 2,
  );

  static final TextStyle label = TextStyle(
    fontSize: 16,
    color: AppColors.darkGray,
    fontWeight: .w700,
  );
}
