import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami_app/util/app_assets.dart';
import 'package:islami_app/util/app_colors.dart';
import 'package:islami_app/util/context_extension.dart';

import 'tabBodyHomeScreen/tabAzkar.dart';
import 'tabBodyHomeScreen/tabHadith/tabHadith.dart';
import 'tabBodyHomeScreen/tabQuran/tabQuran.dart';
import 'tabBodyHomeScreen/tabRadio.dart';
import 'tabBodyHomeScreen/tabTime.dart' show Tabtime;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  List<String> bgScreen = [
    AppImages.bgQuran,
    AppImages.bgHadith,
    AppImages.bgAzkar,
    AppImages.bgRadio,
    AppImages.bgTime,
  ];
  List<Widget> bodyScreen = [
    Tabquran(),
    Tabhadith(),
    Tabazkar(),
    Tabradio(),
    Tabtime(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(bgScreen[currentIndex],fit:BoxFit.fill ,width: double.infinity,height: double.infinity,),
          Scaffold(
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppColors.white
              ),
              child: BottomNavigationBar(
      
                selectedItemColor: AppColors.white,
                unselectedItemColor: AppColors.darkGray,
                onTap: (index) {
                  currentIndex = index;
                  setState(() {});
                },
                currentIndex: currentIndex,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                    icon: BarItem(imagePass: AppIcons.icTabQuran, index: 0),
                    label: "Quran",
                  ),
                  BottomNavigationBarItem(
                    icon:  BarItem(imagePass: AppIcons.icTabHadith, index: 1),
                    label: "Hadith",
                  ),
                  BottomNavigationBarItem(
                    icon:  BarItem(imagePass: AppIcons.icTabAzkar, index: 2),
                    label: "Azkar",
                  ),
                  BottomNavigationBarItem(
                    icon:  BarItem(imagePass: AppIcons.icTabRadio, index: 3),
                    label: "Radio",
                  ),
                  BottomNavigationBarItem(
                    icon:  BarItem(imagePass: AppIcons.icTabTime, index: 4),
                    label: "Time",
                  ),
                ],
                backgroundColor: AppColors.gold,
              ),
            ),
            body: Column(
              children: [
                 Image.asset("assets/images/Group 42.png",height:context.height*.18 ,),
                 Expanded(child: bodyScreen[currentIndex])
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BarItem extends StatelessWidget {
  String imagePass;
  int index;

  BarItem({required this.imagePass, required this.index});

  @override
  Widget build(BuildContext context) {
    return currentIndex == index ?Container(
      decoration: BoxDecoration(
        color: AppColors.mediumDarkGray,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical:6,
      ),
      child: SvgPicture.asset(
        imagePass,
        colorFilter: currentIndex == index? const ColorFilter.mode(
        AppColors.white,
        BlendMode.srcIn,
      )
          : null,
      ),
    ):SvgPicture.asset(
    imagePass,
    );
  }
}
