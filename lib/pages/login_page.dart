// ignore_for_file: unnecessary_null_comparison

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
  late GlobalKey<FormState> formKey;
  bool isShowPassword = false, isSaveLogin = false;
  late FocusNode focusNodeUsername, focusNodePassword;
  bool isCanSubmit = false;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    focusNodeUsername = FocusNode();
    focusNodePassword = FocusNode();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: formKey,
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
                validator: _validatorUsername,
                hintText: 'Tên tài khoản',
                title: 'Tên tài khoản',
                controller: usernameController,
                changeValue: (value) => _onChange(),
              ),
              const SizedBox(
                height: 16,
              ),
              InputPasswordWidget(
                textInputAction: TextInputAction.done,
                validator: _validatorPassword,
                changeValuePassword: (value) => _onChange(),
                focusNode: focusNodePassword,
                hintText: 'Mật khẩu',
                title: 'Mật khẩu',
                controller: passwordController,
                isShowPassword: isShowPassword,
                showPassword: () => _isShowPassword(),
                onFieldSubmitted: () => _submitLogin(),
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
                onPressed: isCanSubmit ? () => _submitLogin() : null,
                child: const Text(
                  'Đăng nhập',
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
      ),
    );
  }

  String? _validatorUsername(String? value) {
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

  _onChange() {
    setState(() {
      isCanSubmit = formKey.currentState?.validate() ?? false;
    });
  }
}
