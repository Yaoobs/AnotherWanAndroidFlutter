part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

//App启动事件
class AppStartEvent extends AuthenticationEvent {}

///登录事件
class LoginEvent extends AuthenticationEvent {
  final User user;

  LoginEvent(this.user);

  @override
  List<Object?> get props => [user];

  @override
  String toString() => "LoggedIn { user: $user }";
}

///退出登录事件
class LogoutEvent extends AuthenticationEvent {}
