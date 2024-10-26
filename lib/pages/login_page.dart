import 'package:flutter/material.dart';
import 'package:gym_app/pages/forgot_password.dart';
import 'package:gym_app/pages/register_page.dart';
import 'package:gym_app/widget/button_app.dart';
import 'package:gym_app/widget/check_box_save_login.dart';
import 'package:gym_app/widget/footer_login.dart';
import 'package:gym_app/widget/input_password.dart';
import 'package:gym_app/widget/input_app_user_name.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '', password = '';
  String? passwordError;
  bool isShowPassword = false, isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            const Text(
              'GYM APP',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: Colors.teal,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InputAppUserNameWidget(
              hintText: 'Tên tài khoản',
              onChange: (value) => _setUsername(
                value: value,
              ),
              title: 'Tên tài khoản',
            ),
            const SizedBox(
              height: 16,
            ),
            InputPasswordWidget(
              hintText: 'Mật khẩu',
              title: 'Mật khẩu',
              onChange: (value) => _setPassword(
                value: value,
              ),
              isShowPassword: isShowPassword,
              showPassword: () => _isShowPassword(),
            ),
            const SizedBox(
              height: 16,
            ),
            CheckboxSaveLoginWidget(
              isCheck: isCheck,
              callbackSave: () => _setSaveLogin(),
              callbackForgotPassword: () => _nextForgotPasswordScreen(context: context),
            ),
            const SizedBox(
              height: 32,
            ),
            ButtonApp(
              title: 'Đăng nhập',
              callback: () => _submitLogin(),
            ),
            const Expanded(child: SizedBox()),
            FooterLoginWidget(
              callback: () => _nextRegisterScreen(context: context),
            ),
            const SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  _setUsername({String? value}) {
    setState(() {
      username = value??'';
    });
  }

  _setPassword({required String value}) {
    setState(() {
      password = value;
    });
  }

  _isShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  _submitLogin() {}

  _nextRegisterScreen({required BuildContext context}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const RegisterPage(),
      ),
    );
  }

  _setSaveLogin() {
    setState(() {
      isCheck = !isCheck;
    });
  }

  _nextForgotPasswordScreen({required BuildContext context}) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ForgotPassword(),
      ),
    );
  }
}
