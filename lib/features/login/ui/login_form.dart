import 'package:anotherwanandroidflutter/common/icons.dart';
import 'package:anotherwanandroidflutter/features/login/ui/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}

class _UsernameInput extends ConsumerWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 只监听 username 相关的字段，其他字段变化不会触发 rebuild
    final usernameError = ref.watch(
      loginViewModelProvider.select(
        (state) => state.value?.username.isNotValid??false
            ? state.value?.username.error
            : null,
      ),
    );
    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        labelText: "手机号",
        labelStyle: const TextStyle(
          fontSize: 16,
        ), // labelWidth 无法直接对应，可通过 Container 约束宽度
        prefixIcon: Icon(AndotherFonts.project),
        counterText: "${controller.text.length}/11",
        errorText: usernameError,
        errorStyle: const TextStyle(fontSize: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
      maxLength: 11,
      keyboardType: TextInputType.phone,
      onChanged: (username) {
        ref.read(loginViewModelProvider.notifier).onUsernameChanged(username);
      },
    );
  }
}

class _PasswordInput extends ConsumerWidget {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 只监听 password 相关的字段，其他字段变化不会触发 rebuild
    final passwordError = ref.watch(
      loginViewModelProvider.select(
        (state) => state.value?.password.isNotValid??false
            ? state.value?.password.error
            : null,
      ),
    );
    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        labelText: "密码",
        labelStyle: const TextStyle(
          fontSize: 16,
        ), // labelWidth 无法直接对应，可通过 Container 约束宽度
        prefixIcon: Icon(AndotherFonts.security),
        counterText: "${controller.text.length}/11",
        errorText: passwordError,
        errorStyle: const TextStyle(fontSize: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 2,
          ),
        ),
      ),
      maxLength: 11,
      keyboardType: TextInputType.text,
      onChanged: (password) {
        ref.read(loginViewModelProvider.notifier).onPasswordChanged(password);
      },
    );
  }
}

class _LoginButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameError =
        ref.watch(loginViewModelProvider).value?.username.isNotValid ?? false;
    final passwordError =
        ref.watch(loginViewModelProvider).value?.password.isNotValid ?? false;
    bool disabled = usernameError || passwordError;
    return OutlinedButton(
      onPressed: () {
        if (!disabled) {
          ref.read(loginViewModelProvider.notifier).onLoginSubmitted();
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('登录失败，请检查账号密码是否正确')));
        }
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.grey, // AppColors.gray
        minimumSize: const Size(double.infinity, 48), // block: true, 宽度充满
        side: const BorderSide(color: Colors.grey), // plain: true 效果
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100), // 圆角
        ),
      ),
      child: const Text("登 录"),
    );
  }
}
