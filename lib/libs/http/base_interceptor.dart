import 'package:dio/dio.dart';
import 'base_response.dart';

class BaseResponseInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Map data = response.data;
    int code = data["errorCode"];
    if (code != ResponseCode.SUCCESS) {
      handler.reject(DioError(
          requestOptions: response.requestOptions, response: response));
    } else {
      response.data = BaseResponse(
          errorCode: data["errorCode"],
          errorMsg: data["errorMsg"],
          data: data["data"]);
      handler.next(response);
    }
  }

  // 在 http.dart 中处理错误逻辑

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) {
  //   print("调用 拦截器 onError");
  //   // error统一处理
  //   ApiException apiException = ApiException.create(err);
  //   EasyLoading.showError(apiException.message);
  //   err.error = apiException;
  //   handler.next(err);
  // }
}
