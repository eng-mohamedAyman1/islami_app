import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentlyProvider extends ChangeNotifier{
  List<int> mostRecently=[];
   Future<void>getMostRecentlyList()async{
    final preference = await SharedPreferences.getInstance();
    mostRecently= (preference.getStringList("MostRecentlyList") ?? []).map((e) {
      return int.parse(e);
    },).toList() ;
    notifyListeners() ;
  }

}