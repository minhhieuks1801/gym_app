import 'package:flutter/material.dart';
import 'package:gym_app/widget/button_app.dart';
import 'package:gym_app/widget/footer_login.dart';
import 'package:gym_app/widget/input_app_user_name.dart';
import 'package:gym_app/widget/input_password.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> usernameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> confirmPasswordFormKey = GlobalKey<FormState>();

  bool isShowPassword = false, isConfirmShowPassword = false;
  String? confirmPasswordError;

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
            InputAppUserNameWidget(
              formKey: usernameFormKey,
              controller: usernameController,
              hintText: 'Tên tài khoản',
              title: 'Tên tài khoản',
            ),
            const SizedBox(
              height: 16,
            ),
            InputPasswordWidget(
              formKey: passwordFormKey,
              controller: passwordController,
              hintText: 'Mật khẩu',
              title: 'Mật khẩu',
              isShowPassword: isShowPassword,
              showPassword: () => _isShowPassword(),
            ),
            const SizedBox(
              height: 16,
            ),
            InputPasswordWidget(
              formKey: confirmPasswordFormKey,
              error: confirmPasswordError,
              controller: confirmPasswordController,
              hintText: 'Nhập lại mật khẩu',
              title: 'Nhập lại mật khẩu',
              isShowPassword: isConfirmShowPassword,
              showPassword: () => _isConfirmShowPassword(),
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

  _isShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  _isConfirmShowPassword() {
    setState(() {
      isConfirmShowPassword = !isConfirmShowPassword;
    });
  }

  _submitRegister() {
    //final username = usernameController.text;
    final bool isValidUsername = usernameFormKey.currentState?.validate() ?? false;
    final bool isValidPassword = passwordFormKey.currentState?.validate() ?? false;
    final bool isValidConfirmPassword = confirmPasswordFormKey.currentState?.validate() ?? false;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    setState(() {
      confirmPasswordError = password != confirmPassword && confirmPassword.isNotEmpty
          ? 'Mật khẩu không trùng khớp'
          : null;
    });
    if (isValidUsername && isValidPassword && isValidConfirmPassword) {}
  }

  _nextLoginScreen({required BuildContext context}) {
    Navigator.of(context).pop();
  }
}
