import 'package:flutter/material.dart';
import 'package:gym_app/widget/button_app.dart';
import 'package:gym_app/widget/footer_login.dart';
import 'package:gym_app/widget/input_app.dart';
import 'package:gym_app/widget/input_password.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();
  String username = '', password = '', confirmPassword = '';
  String? errorUsername, errorPassword, errorConfirmPassword;
  bool isShowPassword = false, isConfirmShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(flex: 1, child: SizedBox()),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'ĐĂNG KÝ TÀI KHOẢN',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
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
              height: 16,
            ),
            InputPasswordWidget(
              hintText: 'Nhập lại mật khẩu',
              title: 'Nhập lại mật khẩu',
              controller: confirmPasswordController,
              onChange: (value) => _setConfirmPassword(
                value: value,
              ),
              isShowPassword: isConfirmShowPassword,
              showPassword: () => _isConfirmShowPassword(),
              error: errorPassword,
            ),
            const SizedBox(
              height: 32,
            ),
            ButtonApp(
              title: 'Đăng ký',
              callback: () => _submitRegister(),
            ),
            const Expanded(flex: 2, child: SizedBox()),
            FooterLoginWidget(
              callback: () => _nextLoginScreen(context: context),
              isLogin: false,
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
      username = value;
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

  _setConfirmPassword({required String value}) {
    setState(() {
      confirmPassword = value;
    });
  }

  _isConfirmShowPassword() {
    setState(() {
      isConfirmShowPassword = !isConfirmShowPassword;
    });
  }

  _submitRegister() {}

  _nextLoginScreen({required BuildContext context}) {
    Navigator.of(context).pop();
  }
}