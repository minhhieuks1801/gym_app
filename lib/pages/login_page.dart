import 'package:flutter/material.dart';
import 'package:gym_app/pages/forgot_password.dart';
import 'package:gym_app/pages/register_page.dart';
import 'package:gym_app/widget/button_app.dart';
import 'package:gym_app/widget/check_box_save_login.dart';
import 'package:gym_app/widget/footer_login.dart';
import 'package:gym_app/widget/input_password.dart';
import 'package:gym_app/widget/input_app.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> usernameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  String? passwordError;
  bool isShowPassword = false, isCheck = false, isSubmit = false;

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
            InputApp(
              validator: _validator,
              formKey: usernameFormKey,
              hintText: 'Tên tài khoản',
              title: 'Tên tài khoản',
              controller: usernameController,
            ),
            const SizedBox(
              height: 16,
            ),
            InputPasswordWidget(
              formKey: passwordFormKey,
              hintText: 'Mật khẩu',
              title: 'Mật khẩu',
              controller: passwordController,
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
            ButtonElevatedApp(
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

  String? _validator(String? value) {
    return (value == null || value.isEmpty) ? 'Tên tài khoản không được để trống' : null;
  }

  _isShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  _submitLogin() {
    final bool isValidUsername = usernameFormKey.currentState?.validate() ?? false;
    final bool isValidPassword = passwordFormKey.currentState?.validate() ?? false;
    if (isValidUsername && isValidPassword) {}
  }

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

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
