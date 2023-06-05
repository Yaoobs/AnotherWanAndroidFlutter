// import 'package:json_annotation/json_annotation.dart';

// part 'base_response.g.dart';

// @JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final int errorCode;
  final String errorMsg;
  final T data;

  BaseResponse({
    required this.errorMsg,
    required this.data,
    required this.errorCode,
  });

  // factory BaseResponse.fromJson(Map<String, dynamic> json) =>
  //     _$BaseResponseFromJson(json);
  // Map<String, dynamic> toJson() => _$BaseResponseToJson(this);

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"errorMsg\":\"$errorMsg\"");
    sb.write(",\"errorMsg\":\"$errorCode\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

class ResponseCode {
  /// 成功
  static const int SUCCESS = 0;

  /// 错误
  static const int ERROR = -1;

  /// 更多
}
