import 'package:flutter/material.dart';
import 'package:islami_app/ul/tabBodyHomeScreen/tabQuran/quranDate.dart';

import '../../../util/app_assets.dart';
import '../../../util/app_colors.dart';
import '../../../util/app_route.dart';
import '../../../util/app_styles.dart';
import '../../../util/context_extension.dart';

class SuraListWidget extends StatelessWidget {
  const SuraListWidget({
    super.key,
    required this.suraFilter,
  });

  final List<int> suraFilter;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoute.SaraScreenRoute,
                arguments: suraFilter[index],
              );
            },
            style: ListTileStyle.list,
            contentPadding: const EdgeInsets.all(12),
            leading: Stack(
              alignment: AlignmentGeometry.center,
              children: [
                Image.asset(
                  AppImages.suraImage,

                  height: context.height * .2,
                ),
                Text(
                  "${Qurandate.getAllSurahs[suraFilter[index]].number}",
                  style: AppStyles.bold20White,
                ),
              ],
            ),
            title: Text(
              '${Qurandate.getAllSurahs[suraFilter[index]].englishName} ',
              style: AppStyles.bold20White,
            ),

            subtitle: Text(
              '${Qurandate.getAllSurahs[suraFilter[index]].ayahCount}  Verses',
              style: AppStyles.bold14White,
            ),

            trailing: Text(
              '${Qurandate.getAllSurahs[suraFilter[index]].arabicName}',
              style: AppStyles.bold20White,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: AppColors.white,
        endIndent: 30,
        indent: 30,
      ),
      itemCount: suraFilter.length,
    );
  }
}
