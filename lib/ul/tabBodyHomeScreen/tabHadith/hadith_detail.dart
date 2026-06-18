import 'package:flutter/material.dart';
import 'package:islami_app/ul/tabBodyHomeScreen/tabHadith/hadithModel.dart';
import 'package:islami_app/util/app_assets.dart';
import 'package:islami_app/util/app_styles.dart';
import 'package:islami_app/util/context_extension.dart';

class HadithDetail extends StatelessWidget {
  const HadithDetail({super.key});
  @override
  Widget build(BuildContext context) {
    Hadithmodel arg = ModalRoute.of(context)?.settings.arguments as Hadithmodel;
    return Scaffold(
      appBar: AppBar(
        title: Text('Hadit ${arg.index}', style: TextStyle(fontSize: 20)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(AppImages.imgLeftCorner),
                      Text('${arg.title}', style: AppStyles.description),
                      Image.asset(AppImages.imgRightCorner),
                    ],
                  ),
                  SizedBox(height: context.height * .02),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        '${arg.content}',
                        style: AppStyles.base24BoldGold,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            "assets/images/img_hadeth_bottom.png",
            width: context.width,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
