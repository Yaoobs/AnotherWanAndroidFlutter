import 'package:anotherwanandroidflutter/features/authentication/repository/authentication_repository.dart';
import 'package:anotherwanandroidflutter/features/authentication/ui/view_model/authentication_view_model.dart';
import 'package:anotherwanandroidflutter/features/login/ui/login_form.dart';
import 'package:flutter/material.dart';
import 'package:anotherwanandroidflutter/common/icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authenticationViewModelProvider, (previous, next) {
      if (next != previous &&
          next.value?.status == AuthenticationStatus.authenticated) {
        Navigator.pop(context);
      }
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(AndotherFonts.back, color: Color(0xFF303133), size: 30),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('登录', style: TextStyle(color: Color(0xff333333))),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ClipOval(
                child: Container(
                  color: Color(0xFFf5f5f5),
                  width: 200.w,
                  height: 200.w,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.account_circle,
                    size: 150.w,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: LoginForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
