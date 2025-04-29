import 'package:dio/dio.dart';
import 'package:login/models/jwt.dart';
import 'package:login/models/urls.dart';
import 'package:login/models/user.dart';
import 'package:login/services/shared_preferences.dart';

class UserService {
  final dio = Dio();

  Future<User?> login(String email, String password) async {
    try {
      Map<String, String> userLogin = {
        'login': email,
        'password': password,
      };

      var response =
          await dio.post('${Urls.bpgAPIService}/auth/login', data: userLogin);

      return await getUserResponse(response, password);
    } catch (e) {
      String? message;
      if (e is DioException) {
        if (e.response?.data is Object) {
          try {
            message = e.response?.data;
          } catch (e) {}
        }
      }
      throw Exception(message == null
          ? 'Ocorreu um erro ao logar usuário'
          : message.toString());
    }
  }

  Future<User?> getUserResponse(
      Response<dynamic> response, String password) async {
    User? user;

    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = response.data;
      SharedPreference.setToken(data['accessToken']);

      var tokenDecoded = Jwt.decodeToken(data['accessToken']);

      user = User(int.parse(tokenDecoded['userId']), tokenDecoded['email'],
          data['accessToken'], tokenDecoded['userName'], password, []);
    }
    return user;
  }
}
