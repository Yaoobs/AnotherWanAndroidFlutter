import 'package:anotherwanandroidflutter/features/authentication/model/user.dart';
import 'package:anotherwanandroidflutter/features/authentication/repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state.freezed.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    @Default(AuthenticationStatus.uninitialized) AuthenticationStatus status,
    User? user,
  }) = _AuthenticationState;

  const AuthenticationState._();

  // 便捷构造函数
  factory AuthenticationState.uninitialized() => const AuthenticationState();
  
  factory AuthenticationState.authenticated(User user) => AuthenticationState(
    status: AuthenticationStatus.authenticated,
    user: user,
  );
  
  factory AuthenticationState.unauthenticated() => const AuthenticationState(
    status: AuthenticationStatus.unauthenticated,
  );
}