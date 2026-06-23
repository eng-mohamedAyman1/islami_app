import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/provider/most_recently_provider.dart';
import 'package:islami_app/ul/tabBodyHomeScreen/tabQuran/quranDate.dart';
import 'package:islami_app/ul/tabBodyHomeScreen/tabQuran/widgets.dart';
import 'package:islami_app/util/app_colors.dart';
import 'package:islami_app/util/app_styles.dart';
import 'package:islami_app/util/context_extension.dart';
import 'package:islami_app/util/launch_service.dart';
import 'package:provider/provider.dart';

import '../../../util/app_assets.dart';

class Tabquran extends StatefulWidget {
  Tabquran({super.key});

  @override
  State<Tabquran> createState() => _TabquranState();
}

class _TabquranState extends State<Tabquran> {
  List<int> suraFilter = List.generate(114, (index) => index);
late MostRecentlyProvider mostRecentlyProvider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        mostRecentlyProvider.getMostRecentlyList();
      },
    );

  }

  @override
  Widget build(BuildContext context) {
     mostRecentlyProvider=Provider.of<MostRecentlyProvider>(context);
    return Padding(
      padding: EdgeInsets.all(context.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.height * .02,
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              List<int> listIndex = [];
              for (int i = 0; i < Qurandate.getAllSurahs.length; i++) {
                if (Qurandate.getAllSurahs[i].englishName
                        .toUpperCase()
                        .contains(value.toUpperCase()) ||
                    Qurandate.getAllSurahs[i].arabicName.contains(value)) {
                  listIndex.add(i);
                }
              }
              suraFilter = listIndex;
              setState(() {});
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
              prefixIcon: Padding(
                padding: EdgeInsets.all(8),
                child: SvgPicture.asset(
                  AppIcons.icTabQuran,
                  colorFilter: ColorFilter.mode(
                    AppColors.gold,
                    BlendMode.srcIn,
                  ),
                  width: 20,
                ),
              ),
              hintText: "Sura Name",
              hintStyle: AppStyles.bold20White,

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.width * 0.04),
                borderSide: BorderSide(color: AppColors.gold, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.width * 0.04),
                borderSide: BorderSide(color: AppColors.gold, width: 1.5),
              ),
            ),
          ),
          Visibility(
            visible:mostRecentlyProvider.mostRecently.isNotEmpty ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Most Recently ', style: AppStyles.bold20White),
                SizedBox(
                  height: context.height * .18,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: context.width * .6,
                        decoration: BoxDecoration(
                          color: AppColors.gold,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      Qurandate.getAllSurahs[mostRecentlyProvider.mostRecently[index]].englishName,
                                      style: AppStyles.bold24DarkGray,
                                    ),
                                    SizedBox(width: context.width * 0.02),
                                    Text(
                                      Qurandate.getAllSurahs[mostRecentlyProvider.mostRecently[index]].arabicName,
                                      style: AppStyles.bold24DarkGray,
                                    ),
                                    SizedBox(width: context.width * 0.02),

                                    Text(
                                      " ${Qurandate.getAllSurahs[mostRecentlyProvider.mostRecently[index]].ayahCount}  Verses  ",
                                      style: AppStyles.label,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Image.asset(
                                  fit: BoxFit.fill,
                                  AppImages.imgMostRecent,
                                  width: context.width * .2,
                                  height: context.height * .15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(width: context.width * 0.02),
                    itemCount: mostRecentlyProvider.mostRecently.length,
                  ),
                ),
              ],
            ),
          ),
          Text('Suras List ', style: AppStyles.bold20White),
          Expanded(
            child: SizedBox(
              child: (suraFilter.isEmpty)
                  ? Center(
                      child: Text(
                        'Sorry, no surah was found with this name.',
                        style: AppStyles.base24BoldGold,
                        textAlign: TextAlign.center,
                      ),
                    )
                  : SuraListWidget(suraFilter: suraFilter),
            ),
          ),
        ],
      ),
    );
  }
}


