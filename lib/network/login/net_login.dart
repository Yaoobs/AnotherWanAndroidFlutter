import 'dart:convert';

import 'package:anotherwanandroidflutter/network/common/net_manager.dart';
import 'package:anotherwanandroidflutter/network/login/net_login_path.dart';
import 'package:dio/dio.dart';

class CNWLoginNetManager {
  static Future<Map> login(String account, String password) async {
    if (account == null || password == null) {
      Response response = Response(statusCode: 404, data: {
        "errorCode": '-1',
        "errorMsg": 'account or password can not be null.'
      });
      return response.data;
    }
    // Map<String, dynamic> queryParameters = {
    //   'username': account,
    //   'password': password,
    // };
    Map<String, dynamic> queryParameters = {
      'username': 'yaoobs',
      'password': 'wawanandroid1990517',
    };
    Map resData = await CNWNetManager.post<Map>(
      net_login_path_login,
      queryParameters: queryParameters,
    );
    return resData;
  }
}
