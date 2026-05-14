import "package:flutter/material.dart";
import "package:introduction_screen/introduction_screen.dart";

import "../util/app_route.dart";
import "../util/launch_service.dart";

class IntroductionScreens extends StatelessWidget {
  const IntroductionScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IntroductionScreen(
          globalBackgroundColor: const Color(0xff202020),
          showNextButton: true,
          showSkipButton: true,
          done: Text("Finish",style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: Color(0xffE2BE7F),
          ),),
          skip: Text("Skip",style: TextStyle(
          fontWeight: FontWeight.w700,
              fontSize: 20.0,
              color: Color(0xffE2BE7F),
        ),),
          next: Text("Next",style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20.0,
            color: Color(0xffE2BE7F),
          ),),
          onSkip: () {
            AppLaunchService.setFirstLaunch();
            /*TODO: fix white flash*/
            Navigator.of(context).pushReplacementNamed(AppRoute.homeScreenRoute);
          },
          onDone: () {
            AppLaunchService.setFirstLaunch();
            /*TODO: fix white flash*/
            Navigator.of(context).pushReplacementNamed(AppRoute.homeScreenRoute);
          },
          pages: [
            PageViewModel(
              decoration: PageDecoration(
                bodyTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xffE2BE7F),
                ),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xffE2BE7F),
                ),

                bodyAlignment: Alignment.bottomCenter,
                fullScreen: true,
              ),

              image: Column(
                children: [
                  Image.asset("assets/images/Group 42.png", height: 250),

                  Image.asset("assets/images/introduction1.png", height: 250),
                ],
              ),
              title: "Welcome To Islmi App",

              body: "",
            ),
            PageViewModel(
              decoration: PageDecoration(
                bodyTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xffE2BE7F),
                ),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xffE2BE7F),
                ),

                bodyAlignment: Alignment.bottomCenter,
                fullScreen: true,
              ),

              image: Column(
                children: [
                  Image.asset("assets/images/Group 42.png", height: 250),

                  Image.asset("assets/images/introduction2.png", height: 250),
                ],
              ),
              title: "Welcome To Islmi App",

              body: "We Are Very Excited To Have You In Our Community",
            ),
            PageViewModel(
              decoration: PageDecoration(
                bodyTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xffE2BE7F),
                ),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xffE2BE7F),
                ),

                bodyAlignment: Alignment.bottomCenter,
                fullScreen: true,
              ),

              image: Column(
                children: [
                  Image.asset("assets/images/Group 42.png", height: 250),

                  Image.asset("assets/images/introduction4.png", height: 250),
                ],
              ),
              title: "Reading the Quran",

              body: "Read, and your Lord is the Most Generous",
            ),
            PageViewModel(
              decoration: PageDecoration(
                bodyTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xffE2BE7F),
                ),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xffE2BE7F),
                ),

                bodyAlignment: Alignment.bottomCenter,
                fullScreen: true,
              ),

              image: Column(
                children: [
                  Image.asset("assets/images/Group 42.png", height: 250),

                  Image.asset("assets/images/introduction3.png", height: 250),
                ],
              ),
              title: "Bearish",

              body: "Praise the name of your Lord, the Most High",
            ),
            PageViewModel(
              decoration: PageDecoration(
                bodyTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xffE2BE7F),
                ),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: Color(0xffE2BE7F),
                ),

                bodyAlignment: Alignment.bottomCenter,
                fullScreen: true,
              ),

              image: Column(
                children: [
                  Image.asset("assets/images/Group 42.png", height: 250),

                  Image.asset("assets/images/introduction5.png", height: 250),
                ],
              ),
              title: "Holy Quran Radio",

              body: "You can listen to the Holy Quran Radio through the application for free and easily",
            ),
          ],
        ),
      ),
    );
  }
}
