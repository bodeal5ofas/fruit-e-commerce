import 'package:shared_preferences/shared_preferences.dart';

 class SharedPrefrenceHelper {
  static late SharedPreferences _instant;
  static Future<void> initSharedPref()async{
     _instant= await SharedPreferences.getInstance();
  }
  static setBool(String key,bool value)async{
    await    _instant.setBool(key, value);
  }
  static bool getBool(String key){
   return _instant.getBool(key)?? false;
  }
}