import 'package:login/models/jwt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("tokenJWT", token);
  }

  static Future<String> getJWT() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("tokenJWT");
    if(token == null){
      //logout
      return '';
    }
    return token;
  }

  static Future<dynamic?> getProperty(String property) async {
    String? tokenJwt = await getJWT();

    if (tokenJwt != null) {
      var tokenDecoded = Jwt.decodeToken(tokenJwt);
      return tokenDecoded[property];
    }

    return null;
  }

  static Future<int?> getUserId() async {
    return await getProperty('userId');
  }

  static Future<String?> getUserName() async {
    return await getProperty('userName');
  }

  static Future<String?> getUserEmail() async {
    return await getProperty('email');
  }

  static Future<String?> getPassword() async {
    return await getProperty('password');
  }

  static void removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
