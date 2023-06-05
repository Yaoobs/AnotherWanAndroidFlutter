import 'package:anotherwanandroidflutter/common/icons.dart';
import 'package:anotherwanandroidflutter/common/values/colors.dart';
import 'package:anotherwanandroidflutter/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vant_kit/main.dart';
import 'package:formz/formz.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..showSnackBar(
              const SnackBar(content: Text('登录失败，请检查账号密码是否正确')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(0)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(15)),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = TextEditingController();
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Field(
          controller: _controller,
          autofocus: true,
          placeholder: "手机号",
          labelWidth: 50,
          maxLength: 11,
          leftIcon: AndotherFonts.project,
          keyboardType: TextInputType.phone,
          error: state.username.invalid,
          errorMessage: state.username.invalid ? state.username.error : null,
          onChange: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Field(
          controller: _controller,
          placeholder: "密码",
          type: "password",
          labelWidth: 50,
          leftIcon: AndotherFonts.security,
          keyboardType: TextInputType.text,
          error: state.password.invalid,
          errorMessage: state.password.invalid ? state.password.error : null,
          onChange: (password) =>
              context.read<LoginBloc>().add(LoginPasswordChanged(password)),
        );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return NButton(
          loading: state.status.isSubmissionInProgress,
          disabled:
              state.status.isInvalid || state.status.isSubmissionInProgress,
          block: true,
          color: AppColors.primaryColor,
          text: "登 录",
          borderRadius: BorderRadius.circular(100.w),
          onClick: () {
            if (!state.status.isInvalid)
              context.read<LoginBloc>().add(const LoginSubmitted());
          },
        );
      },
    );
  }
}
