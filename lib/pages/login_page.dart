import 'package:flutter/material.dart';
import 'package:gym_app/common/ultils/regex.dart';
import 'package:gym_app/pages/forgot_password.dart';
import 'package:gym_app/pages/register_page.dart';
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
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  GlobalKey<FormState> usernameFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  String? passwordError;
  bool isShowPassword = false, isSaveLogin = false;
  late FocusNode focusNodeUsername, focusNodePassword;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    focusNodeUsername = FocusNode();
    focusNodePassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Text(
              'GYM APP',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: theme.textTheme.titleLarge
                  ?.copyWith(color: const Color.fromARGB(255, 7, 255, 164)),
            ),
            const SizedBox(
              height: 16,
            ),
            InputApp(
              textInputAction: TextInputAction.next,
              focusNode: focusNodeUsername,
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
              textInputAction: TextInputAction.none,
              validator: _validatorPassword,
              focusNode: focusNodePassword,
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
              isValueCheckbox: isSaveLogin,
              callbackSave: () => _setSaveLogin(),
              callbackForgotPassword: () =>
                  _nextForgotPasswordScreen(context: context),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () => _submitLogin(),
              child: Text(
                'Đăng nhập',
                style:
                    theme.textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
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
    return (value == null || value.isEmpty)
        ? 'Tên tài khoản không được để trống'
        : null;
  }

  String? _validatorPassword(String? value) {
    if ((value == null || value.isEmpty)) {
      return 'Mật khẩu không được để trống';
    }
    if (!RegexInput.regex.hasMatch(value)) {
      return 'Sai định dạng mật khẩu';
    }
    return null;
  }

  _isShowPassword() {
    setState(() {
      isShowPassword = !isShowPassword;
    });
  }

  _submitLogin() {
    final bool isValidUsername =
        usernameFormKey.currentState?.validate() ?? false;
    final bool isValidPassword =
        passwordFormKey.currentState?.validate() ?? false;

    if (isValidUsername && isValidPassword) {
    } else if (!isValidUsername) {
      focusNodeUsername.requestFocus();
    } else if (!isValidPassword) {
      focusNodePassword.requestFocus();
    }
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
      isSaveLogin = !isSaveLogin;
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
    focusNodeUsername.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }
}
