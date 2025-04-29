import 'dart:convert';

class Jwt{
  static dynamic decodeToken(String token){
    token = token.split('.')[1];
    return jsonDecode(utf8.fuse(base64).decode(base64.normalize(token)));
  }
}