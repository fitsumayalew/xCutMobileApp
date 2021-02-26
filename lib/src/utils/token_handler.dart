import 'package:shared_preferences/shared_preferences.dart';

class TokenHandler {

  static setToken(jwt) async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString('token', jwt);
  }

  static getToken() async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString('token');
  }

  static removeToken() async{
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove('token');
  }
}