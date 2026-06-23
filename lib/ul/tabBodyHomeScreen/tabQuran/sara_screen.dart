import 'package:flutter/material.dart';
import 'package:islami_app/provider/most_recently_provider.dart';
import 'package:islami_app/util/app_assets.dart';
import 'package:islami_app/util/app_styles.dart';
import 'package:islami_app/util/context_extension.dart';
import 'package:provider/provider.dart';

import 'quranDate.dart';
import 'sara_data_on_bottom.dart';
import 'sara_data_on_text.dart';

class SaraScreen extends StatefulWidget {
  @override
  State<SaraScreen> createState() => _SaraScreenState();
}

class _SaraScreenState extends State<SaraScreen> {
  bool selectButton = true;
  late MostRecentlyProvider mostRecentlyProvider;
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    mostRecentlyProvider=Provider.of<MostRecentlyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('${Qurandate.getAllSurahs[index].englishName}'),
        actions: [
          Container(
            width: context.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectButton = true;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(microseconds: 500),
                      alignment: AlignmentDirectional.center,
                      height: 55,
                      padding: EdgeInsetsGeometry.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: selectButton ? Colors.white : Colors.transparent,
                      ),
                      child: Icon(Icons.view_list),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectButton = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(microseconds: 400),
                      height: 55,
                      alignment: AlignmentDirectional.center,
                      padding: EdgeInsetsGeometry.symmetric(vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: !selectButton
                            ? Colors.white
                            : Colors.transparent,
                      ),
                      child: Icon(Icons.text_snippet_outlined),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
                      Text(
                        '${Qurandate.getAllSurahs[index].arabicName}',
                        style: AppStyles.description,
                      ),
                      Image.asset(AppImages.imgRightCorner),
                    ],
                  ),
                  SizedBox(
                    height: context.height*.02,
                  ),
                  Expanded(child: !selectButton ? SaraDataOnText(index: index, ) : SaraDataOnBottom(index: index,),)

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
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    mostRecentlyProvider.getMostRecentlyList();
  }
}
