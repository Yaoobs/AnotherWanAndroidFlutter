import 'package:formz/formz.dart';

class Password extends FormzInput<String, String> {
  const Password.pure() : super.pure('');
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.isEmpty) return "请输入登录密码";

    if (value.length < 6) return "密码不能少于6个字符";
    return null;
  }
}
