import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ul/tabBodyHomeScreen/tabHadith/hadithModel.dart';
import 'package:islami_app/util/app_assets.dart';
import 'package:islami_app/util/app_colors.dart';
import 'package:islami_app/util/app_route.dart';
import 'package:islami_app/util/context_extension.dart';

class HadithItem extends StatefulWidget {
  int index;
  HadithItem({super.key, required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  String title = '';

  String content = '';
  @override
  void initState() {
    // TODO: implement initState
    loadHadith(widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return title.isEmpty
        ? Center(child: CircularProgressIndicator())
        : GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoute.hadithScreenRoute,
                arguments: Hadithmodel(
                  title: title,
                  index: widget.index,
                  content: content,
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.gold,
                image: DecorationImage(
                  image: AssetImage(AppImages.bgHadethCard),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          AppImages.imgLeftCorner,
                          color: Colors.black,
                        ),
                        Expanded(
                          child: Text(
                            title,
                            style: TextStyle(fontSize: 24),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Image.asset(
                          AppImages.imgRightCorner,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
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
            ),
          );
  }

  Future<void> loadHadith(int index) async {
    String text = await rootBundle.loadString(
      "assets/files/hadeeth/h$index.txt",
    );

    title = text.substring(0, text.indexOf("\n"));

    content = text.substring(text.indexOf("\n") + 1);
    Future.delayed(Duration(seconds: 2), () => setState(() {}));
  }
}
