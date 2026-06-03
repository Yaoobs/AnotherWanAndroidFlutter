import 'package:anotherwanandroidflutter/api/login/login_api.dart';
import 'package:anotherwanandroidflutter/features/authentication/model/user.dart';
import 'package:anotherwanandroidflutter/features/authentication/ui/view_model/authentication_view_model.dart';
import 'package:anotherwanandroidflutter/features/login/model/password.dart';
import 'package:anotherwanandroidflutter/features/login/model/username.dart';
import 'package:anotherwanandroidflutter/features/login/ui/state/login_state.dart';
import 'package:formz/formz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_view_model.g.dart';

@Riverpod(keepAlive: false)
class LoginViewModel extends _$LoginViewModel {
  // late AuthenticationViewModel _authenticationViewModel;
  @override
  FutureOr<LoginState> build() async {
    // _authenticationViewModel = await ref.watch(
    //   authenticationViewModelProvider.notifier,
    // );
    return LoginState();
  }

  void onUsernameChanged(String name) async {
    final username = Username.dirty(name);
    state = AsyncData(state.value!.copyWith(username: username));
  }

  void onPasswordChanged(String pw) {
    final password = Password.dirty(pw);
    state = AsyncData(state.value!.copyWith(password: password));
  }

  onLoginSubmitted() async {
    if (Formz.validate([state.value!.username, state.value!.password])) {
      state = AsyncLoading();
      try {
        User usr = await LoginApi.login(
          state.value!.username.value,
          state.value!.password.value,
        );
        ref.watch(authenticationViewModelProvider.notifier).onLogin(usr);
        state = AsyncData(
          state.value!.copyWith(
            username: Username.dirty(state.value!.username.value),
            password: Password.dirty(state.value!.password.value),
          ),
        );
      } catch (error) {
        state = AsyncError(error, StackTrace.current);
      }
    }
  }
}
