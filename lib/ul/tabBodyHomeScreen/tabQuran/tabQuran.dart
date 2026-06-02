import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/ul/tabBodyHomeScreen/tabQuran/quranDate.dart';
import 'package:islami_app/util/app_colors.dart';
import 'package:islami_app/util/app_route.dart';
import 'package:islami_app/util/app_styles.dart';
import 'package:islami_app/util/context_extension.dart';

import '../../../util/app_assets.dart';

class Tabquran extends StatelessWidget {
  const Tabquran({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.width * 0.04),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start ,
        spacing: context.height * .02,
        children: [
          TextField(
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
          Text('Most Recently ', style: AppStyles.bold20White),
          SizedBox(
            height: context.height*.18,
            child: ListView.separated(
              scrollDirection:Axis.horizontal ,
              itemBuilder:(context, index) {
                return Container(
                  width: context.width * .6,
                  decoration: BoxDecoration(
                    color: AppColors.gold,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Qurandate.getAllSurahs[index].englishName,style: AppStyles.bold24DarkGray,),
                              SizedBox(
                                width: context.width*0.02,
                              ),
                              Text(Qurandate.getAllSurahs[index].arabicName,style: AppStyles.bold24DarkGray,),
                              SizedBox(
                                width: context.width*0.02,
                              ),

                              Text(" ${Qurandate.getAllSurahs[index].ayahCount}  Verses  ",style: AppStyles.label,),
                            ],
                          ),
                        ),
                        Image.asset(
                          AppImages.imgMostRecent,
                          width: context.width*.25,
                          height: context.height*.2,
                        ),
                      ],
                    ),
                  )
                );
              },
              separatorBuilder:(context,index)=> SizedBox(
                 width: context.width*0.02,
              ),
              itemCount: 10,
            ),
          ),
          Text('Suras List ', style: AppStyles.bold20White),
          SizedBox(
            height: context.height*.17,
            child: ListView.separated(

              itemBuilder:(context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    onTap:(){
                      Navigator.pushNamed(context, AppRoute.SaraScreenRoute,arguments:index );
                    },
                    style:ListTileStyle.list ,
                    contentPadding: const EdgeInsets.all(12),
                    leading:Stack(
                      alignment: AlignmentGeometry.center,
                      children: [
                        Image.asset(

                          AppImages.suraImage,

                          height: context.height*.2,
                        ),
                        Text("${++index}",style: AppStyles.bold20White,),
                      ],
                    ) ,
                    title: Text(
                        '${Qurandate.getAllSurahs[index].englishName} '  ,style: AppStyles.bold20White,                 ),

                    subtitle: Text('${Qurandate.getAllSurahs[index].ayahCount}  Verses',style: AppStyles.bold14White, ),

                    trailing: Text('${Qurandate.getAllSurahs[index].arabicName}',style: AppStyles.bold20White,),
                  ),
                );
              },
              separatorBuilder:(context,index)=> Divider(
                height: 1,
                 color: AppColors.white,
                endIndent:30 ,
                indent: 30,
              ),
              itemCount: Qurandate.getAllSurahs.length,
            ),
          ),

        ],
      ),
    );
  }
}
