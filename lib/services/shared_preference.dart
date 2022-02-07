import 'dart:convert';
import 'package:shared_preference/pages/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs{

  static storeEmail(String email) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
  }

  static Future<String?> loadEmail() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  static Future<bool> removeEmail() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("email");
  }


  static storeUser(User user) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    prefs.setString("user", stringUser);
  }

  static Future<User?> loadUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString("user");
    if(stringUser==null || stringUser.isEmpty) return null;

    Map<String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }

  static Future<bool> removeUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }

}