import 'package:flutter/material.dart';
import 'package:gym_app/common/ultils/regex.dart';
import 'package:gym_app/pages/register_page.dart';
import 'package:gym_app/widget/button_app.dart';
import 'package:gym_app/widget/footer_login.dart';
import 'package:gym_app/widget/input_password.dart';
import 'package:gym_app/widget/input_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController();
  String username = '', password = '';
  String? errorUsername, errorPassword;
  bool isShowPassword = false;

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
              'ĐĂNG KÝ 1 THÁNG TẬP 3 NGÀY',
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
            InputAppWidget(
              hintText: 'Tên tài khoản',
              controller: usernameController,
              onChange: (value) => _setUsername(
                value: value,
              ),
              error: errorUsername,
              title: 'Tên tài khoản',
            ),
            const SizedBox(
              height: 16,
            ),
            InputPasswordWidget(
              hintText: 'Mật khẩu',
              title: 'Mật khẩu',
              controller: passwordController,
              onChange: (value) => _setPassword(
                value: value,
              ),
              isShowPassword: isShowPassword,
              showPassword: () => _isShowPassword(),
              error: errorPassword,
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

  _setUsername({required String value}) {
    setState(() {
      if (value.isEmpty) {
        errorUsername = 'Tên tài khoản không được để trống';
      } else {
        errorUsername = null;
      }
      username = value;
    });
  }

  _setPassword({required String value}) {
    setState(() {
      if (value.isEmpty) {
        errorPassword = 'Mật khẩu không được để trống';
      } else if (!RegexInput.regex.hasMatch(value)) {
        errorPassword = 'Sai định dạng mật khẩu';
      } else {
        errorPassword = null;
      }
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
}
