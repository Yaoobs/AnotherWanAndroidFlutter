import 'package:anotherwanandroidflutter/features/login/model/password.dart';
import 'package:anotherwanandroidflutter/features/login/model/username.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(Username.pure()) Username username,
    @Default(Password.pure()) Password password,
    String? errorMessage,
  }) = _LoginState;
}
