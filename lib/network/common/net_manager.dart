import 'net_config.dart' as NetConfig;
import 'package:dio/dio.dart';

final Dio dio = Dio(NetConfig.options);

class CNWNetManager {
  static Future<T> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async {
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
    Response response = await dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);
    
    int code = response.data['errorCode'];
    T resData = response.data['data'];
    return resData;
  }
}
