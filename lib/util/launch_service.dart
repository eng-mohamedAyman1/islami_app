
import 'package:shared_preferences/shared_preferences.dart';

class AppLaunchService {
  static Future<bool> isFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool("isFirstLaunch") ?? true;
  }

  static Future<void> setFirstLaunch() async {
    final preference = await SharedPreferences.getInstance();
    preference.setBool("isFirstLaunch", false);
  }
  static Future<void>setSuraToMostRecently(int index)async{
    final preference = await SharedPreferences.getInstance();
    List<String> mostRecentlyList=preference.getStringList("MostRecentlyList")??[];
    if(mostRecentlyList.contains(index.toString())){
      mostRecentlyList.remove(index.toString());
    }
    mostRecentlyList.insert(0,"$index");
    if(mostRecentlyList.length>5){
      mostRecentlyList.removeLast();
    }
    print(mostRecentlyList);
    preference.setStringList("MostRecentlyList",mostRecentlyList );
  }
  static Future<List<int>>getMostRecentlyList()async{
    final preference = await SharedPreferences.getInstance();
    List<int> mostRecentlyList= (preference.getStringList("MostRecentlyList") ?? []).map((e) {
     return int.parse(e);
    },).toList() ;

    return mostRecentlyList ;
  }
}