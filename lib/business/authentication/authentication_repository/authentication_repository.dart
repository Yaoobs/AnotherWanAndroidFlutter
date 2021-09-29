import 'dart:async';
import 'package:anotherwanandroidflutter/network/network.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  late Map<dynamic, dynamic> _userData;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Map get userData {
    return _userData;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    assert(username != null);
    assert(password != null);

    Map res = await CNWLoginNetManager.login(username, password);
    print(res);
    _userData = res is Map ? res : {};

    _controller.add(AuthenticationStatus.authenticated);
    // await Future.delayed(
    //   const Duration(milliseconds: 300),
    //   () => _controller.add(AuthenticationStatus.authenticated),
    // );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
