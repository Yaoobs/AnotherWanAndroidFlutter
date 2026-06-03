import 'package:anotherwanandroidflutter/features/authentication/model/user.dart';
import 'package:anotherwanandroidflutter/api/login/login_api_path.dart';
import 'package:anotherwanandroidflutter/http/http_manager.dart';

class LoginApi {
  static Future<User> login(String account, String password) async {
    Map<String, dynamic> queryParameters = {
      'username': "yaoobs",
      'password': "wawanandroid1990517",
    };
    return HttpManager.post(
      net_login_path_login,
      params: queryParameters,
    ).then((json) => User.fromJson(json));
  }
}
