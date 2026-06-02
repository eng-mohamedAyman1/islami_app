import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/util/app_colors.dart';
import 'package:islami_app/util/app_styles.dart';
import 'package:islami_app/util/context_extension.dart';

class SaraDataOnBottom extends StatefulWidget {

  int index;
   SaraDataOnBottom({super.key,required this.index});

  @override
  State<SaraDataOnBottom> createState() => _SaraDataOnBottomState();
}

class _SaraDataOnBottomState extends State<SaraDataOnBottom> {
  int clickIndex=0;
  List<String> aya = [];
  @override
  Widget build(BuildContext context) {
    if(aya.isEmpty ){loadSara(widget.index);}
    return aya.isEmpty
        ? Center(child: CircularProgressIndicator(
      color: AppColors.gold,
    ))
        :ListView.separated(itemBuilder: (context, index) {
      return GestureDetector(
        onTap: () {
          setState(() {
            clickIndex=index;
          });
        },
        child: Container(
padding: EdgeInsets.all(16 ),
        alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
            color:(clickIndex==index)? AppColors.gold:Colors.transparent,
            border: Border.all(color: AppColors.gold)
          ),
          child: Text(
            ' ${aya[index]}[${index + 1}]',style:(clickIndex==index)?AppStyles.bold24DarkGray: AppStyles.base24BoldGold,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
          ),
        ),
      );
    },
      itemCount: aya.length,
      separatorBuilder: (context, index) => SizedBox(
        height: context.height*.02,
      ),
    );
  }

  Future<void> loadSara(int index) async {
    String sara = await rootBundle.loadString(
      "assets/files/quran/${index + 1}.txt",
    );

    aya = sara.split("\n");
    Future.delayed(Duration(seconds :2),() => setState(() {

    }),);
  }
}
