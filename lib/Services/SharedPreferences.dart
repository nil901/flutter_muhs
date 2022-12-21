
import 'package:shared_preferences/shared_preferences.dart';

class PrefService { 
  Future createCache(String passworld) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("passworld", passworld);
    }

    Future readCache(String passworld) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var cash = pref.getString("passworld");
      return cash;
    }

    Future removeCache(String passworld) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.getString("passworld");
    }
}