import 'package:flutter/material.dart';
import 'package:islami_app/util/app_assets.dart';
import 'package:islami_app/util/app_styles.dart';
import 'package:islami_app/util/context_extension.dart';

class Tabazkar extends StatelessWidget {
  const Tabazkar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
        Expanded(
          child: Container(
            width: context.width,
            decoration: BoxDecoration(

              image: DecorationImage(

                image: AssetImage("assets/images/Sebha.png"),
              ),
            ),
            child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: context.height*.08,
                ),
                Text("سبحان الله",style: TextStyle(fontSize: 40, color: Colors.white),),
                Text("30",style: TextStyle(fontSize: 40, color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
