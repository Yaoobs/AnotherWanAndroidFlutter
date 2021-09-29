import 'package:flutter/material.dart';
import 'package:anotherwanandroidflutter/business/authentication/authentication.dart';
import 'package:anotherwanandroidflutter/common/icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anotherwanandroidflutter/business/login/login.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            AndotherFonts.back,
            color: Color(0xFF303133),
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '登录',
          style: TextStyle(
            color: Color(0xff333333),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthenticationStatus.authenticated:
              Navigator.pop(context);
              break;
            case AuthenticationStatus.unauthenticated:
              break;
            default:
              break;
          }
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Icon(
                  Icons.account_circle,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 80.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: BlocProvider(
                  create: (context) {
                    return LoginBloc(
                      authenticationRepository:
                          RepositoryProvider.of<AuthenticationRepository>(
                              context),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: LoginForm(),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
