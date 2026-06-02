import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/util/app_styles.dart';

class SaraDataOnText extends StatefulWidget {
  int index;

  SaraDataOnText({super.key, required this.index});

  @override
  State<SaraDataOnText> createState() => _SaraDataOnTextState();
}

class _SaraDataOnTextState extends State<SaraDataOnText> {
  String aya = "";

  @override
  Widget build(BuildContext context) {
   if(aya.isEmpty ){loadSara(widget.index);}
    return aya.isEmpty
        ? Center(child: CircularProgressIndicator())
        :Text(
      '$aya',style: AppStyles.base24BoldGold,
    textAlign: TextAlign.center,
    textDirection: TextDirection.rtl,
    );
  }

  Future<void> loadSara(int index) async {
    String sara = await rootBundle.loadString(
      "assets/files/quran/${index + 1}.txt",
    );

    aya = sara.split("\n").asMap()
        .entries
        .map((e) => '${e.value}[${e.key + 1}] ')
        .join('');


   Future.delayed(Duration(seconds: 2),() => setState(() {

   }),) ;
  }
}
