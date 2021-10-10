import 'package:anotherwanandroidflutter/network/login/net_login_path.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'net_config.dart' as NetConfig;
import 'package:dio/dio.dart';

final Dio dio = Dio(NetConfig.options);

class AWANetManager {
  static Future<T> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
    //统一添加cookie(写在这是不是也有些不优雅)
    SharedPreferences sp = await SharedPreferences.getInstance();
    String cookie = sp.get("cookie");
    if (cookie != null) {
      final Map<String, dynamic> headers = <String, dynamic>{
        'Cookie': cookie,
      };
      options = Options(headers: headers);
    }

    Response response = await dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress);
    int code = response.data['errorCode'];
    T data = response.data['data'];
    return data;
  }

  static Future<T> post<T>(
    String path, {
    data,
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onSendProgress,
    ProgressCallback onReceiveProgress,
  }) async {
    //统一添加cookie(写在这是不是也有些不优雅)
    SharedPreferences sp = await SharedPreferences.getInstance();
    String cookie = sp.get("cookie");
    if (cookie != null) {
      final Map<String, dynamic> headers = <String, dynamic>{
        'Cookie': cookie,
      };
      options = Options(headers: headers);
    }

    Response response = await dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

    int code = response.data['errorCode'];
    T resData = response.data['data'];

    // //报存登录接口的cookie,写在这里有些不优雅(0-0)
    if (path.contains(net_login_path_login)) {
      SharedPreferences sp = await SharedPreferences.getInstance();
      // print('cookie:  '+response.headers['set-cookie'].toString());
      await sp.setString("cookie", response.headers['set-cookie'].toString());
    }

    return resData;
  }
}
