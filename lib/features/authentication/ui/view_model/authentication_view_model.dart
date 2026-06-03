import 'package:anotherwanandroidflutter/features/authentication/model/user.dart';
import 'package:anotherwanandroidflutter/features/authentication/repository/authentication_repository.dart';
import 'package:anotherwanandroidflutter/features/authentication/ui/state/authentication_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_view_model.g.dart';

@Riverpod(keepAlive: true)
class AuthenticationViewModel extends _$AuthenticationViewModel {
  late AuthenticationRepository _repository;
  @override
  FutureOr<AuthenticationState> build() async {
    _repository = await ref.watch(authenticationRepositoryProvider.future);
    User? user = _repository.getUser();
    if (user != null) {
      return AuthenticationState.authenticated(user);
    } else {
      return AuthenticationState.uninitialized();
    }
  }

  void onLogin(User user) {
    _repository.saveAuthenticationInfo(user);
    state = AsyncData(AuthenticationState.authenticated(user));
  }

  void onLogout(User user) {
    _repository.clearAuthenticationInfo();
    state = AsyncData(AuthenticationState.unauthenticated());
  }
}
