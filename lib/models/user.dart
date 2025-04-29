import 'package:login/models/userClaim.dart';

class User{
  int id;
  String email;
  String token;
  String name;
  String password;
  List<UserClaim> userClaims;

  User(this.id, this.email, this.token, this.name, this.password,
      this.userClaims);
}