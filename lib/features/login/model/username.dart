import 'package:anotherwanandroidflutter/utils/regex/regex_utils.dart';
import 'package:formz/formz.dart';

class Username extends FormzInput<String, String> {
  const Username.pure() : super.pure('');
  const Username.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if (value.isEmpty) return "手机号不能为空";

    if (!RegexUtils.isMobileExact(value)) return "手机号格式错误";
    return null;
  }
}
