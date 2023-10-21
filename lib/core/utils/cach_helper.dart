import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{


  static  late SharedPreferences prefs ;

  static init() async{
    prefs  = await SharedPreferences.getInstance();
  }

  static saveData({required String stringToken})async{

    await prefs.setString('token', stringToken);

  }

  static String? getData(){

   return prefs.getString('token');
  }

  static  deleteData({required String stringToken})async{
    // Remove data for the 'counter' key.
    await prefs.remove('token');
  }


}