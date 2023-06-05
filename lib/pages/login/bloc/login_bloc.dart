import 'package:anotherwanandroidflutter/api/login/login_api.dart';
import 'package:anotherwanandroidflutter/common/authentication/authentication.dart';
import 'package:anotherwanandroidflutter/global.dart';
import 'package:anotherwanandroidflutter/models/User.dart';
import 'package:anotherwanandroidflutter/pages/login/models/password.dart';
import 'package:anotherwanandroidflutter/pages/login/models/username.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<UserLoginEvent, LoginState> {
  final AuthenticationBloc _authenticationBloc;

  LoginBloc({
    required AuthenticationBloc authenticationBloc,
  })  : _authenticationBloc = authenticationBloc,
        super(const LoginState()) {
    on<LoginUsernameChanged>(
        (event, emit) => _mapUsernameChangedToState(event, emit));

    on<LoginPasswordChanged>(
        (event, emit) => _mapPasswordChangedToState(event, emit));

    on<LoginSubmitted>((event, emit) => _mapLoginSubmittedToState(event, emit));
  }

  _mapUsernameChangedToState(
    LoginUsernameChanged event,
    Emitter<LoginState> emit,
  ) {
    final username = Username.dirty(event.username);
    emit(state.copyWith(
      username: username,
      status: Formz.validate([state.password, username]),
    ));
  }

  _mapPasswordChangedToState(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password, state.username]),
    ));
  }

  _mapLoginSubmittedToState(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        User usr =
            await LoginApi.login(state.username.value, state.password.value);
        _authenticationBloc.add(LoginEvent(Global.loginCookie ?? "", usr));
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on Exception catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
