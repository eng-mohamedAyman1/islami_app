import 'package:flutter/material.dart';
import 'package:islami_app/ul/tabBodyHomeScreen/tabQuran/quranDate.dart';
import 'package:islami_app/util/launch_service.dart';

import '../../../util/app_assets.dart';
import '../../../util/app_colors.dart';
import '../../../util/app_route.dart';
import '../../../util/app_styles.dart';
import '../../../util/context_extension.dart';

class SuraListWidget extends StatefulWidget {
  const SuraListWidget({
    super.key,
    required this.suraFilter,
  });

  final List<int> suraFilter;

  @override
  State<SuraListWidget> createState() => _SuraListWidgetState();
}

class _SuraListWidgetState extends State<SuraListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            onTap: () {
              AppLaunchService.setSuraToMostRecently(widget.suraFilter[index]);
              Navigator.pushNamed(
                context,
                AppRoute.SaraScreenRoute,
                arguments: widget.suraFilter[index],
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
                  "${Qurandate.getAllSurahs[widget.suraFilter[index]].number}",
                  style: AppStyles.bold20White,
                ),
              ],
            ),
            title: Text(
              '${Qurandate.getAllSurahs[widget.suraFilter[index]].englishName} ',
              style: AppStyles.bold20White,
            ),

            subtitle: Text(
              '${Qurandate.getAllSurahs[widget.suraFilter[index]].ayahCount}  Verses',
              style: AppStyles.bold14White,
            ),

            trailing: Text(
              '${Qurandate.getAllSurahs[widget.suraFilter[index]].arabicName}',
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
      itemCount: widget.suraFilter.length,
    );
  }
}
