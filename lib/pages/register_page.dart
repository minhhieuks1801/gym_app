import 'package:flutter/material.dart';
import 'package:gym_app/common/ultils/regex.dart';
import 'package:gym_app/widget/footer_login.dart';
import 'package:gym_app/widget/input_app.dart';
import 'package:gym_app/widget/input_password.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late GlobalKey<FormState> formKey;
  late FocusNode focusNodeUsername, focusNodePassword, focusNodeConfirmPassword;
  bool isCanSubmit = false;

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    focusNodeUsername = FocusNode();
    focusNodePassword = FocusNode();
    focusNodeConfirmPassword = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'ĐĂNG KÝ TÀI KHOẢN',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: theme.textTheme.titleLarge
                      ?.copyWith(color: const Color.fromARGB(255, 7, 255, 164)),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              InputApp(
                textInputAction: TextInputAction.next,
                focusNode: focusNodeUsername,
                validator: _validatorUsername,
                changeValue: (value) => _onChange(),
                controller: usernameController,
                hintText: 'Tên tài khoản',
                title: 'Tên tài khoản',
              ),
              const SizedBox(
                height: 16,
              ),
              InputPasswordWidget(
                textInputAction: TextInputAction.next,
                focusNode: focusNodePassword,
                validator: (value) =>
                    _validatorPassword(value: value, checkConfirm: false),
                changeValuePassword: (value) => _onChange(),
                controller: passwordController,
                hintText: 'Mật khẩu',
                title: 'Mật khẩu',
                onFieldSubmitted: () => _onFieldSubmittedPassword(),
              ),
              const SizedBox(
                height: 16,
              ),
              InputPasswordWidget(
                textInputAction: TextInputAction.done,
                focusNode: focusNodeConfirmPassword,
                validator: (value) =>
                    _validatorPassword(value: value, checkConfirm: true),
                changeValuePassword: (value) => _onChange(),
                controller: confirmPasswordController,
                hintText: 'Nhập lại mật khẩu',
                title: 'Nhập lại mật khẩu',
                onFieldSubmitted: () => _submitRegister(),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: isCanSubmit ? () => _submitRegister() : null,
                child: const Text(
                  'Đăng ký',
                ),
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
      ),
    );
  }

  String? _validatorPassword({String? value, bool checkConfirm = false}) {
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    if ((value == null || value.isEmpty)) {
      return 'Mật khẩu không được để trống';
    }
    if (!RegexInput.regex.hasMatch(value)) {
      return 'Sai định dạng mật khẩu';
    }
    if (checkConfirm &&
        password != confirmPassword &&
        confirmPassword.isNotEmpty &&
        password.isNotEmpty) {
      return 'Mật khẩu không trùng khớp';
    }
    return null;
  }

  String? _validatorUsername(String? value) {
    return (value == null || value.isEmpty)
        ? 'Tên tài khoản không được để trống'
        : null;
  }

  _submitRegister() {}

  _nextLoginScreen({required BuildContext context}) {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    focusNodeUsername.dispose();
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    super.dispose();
  }

  _onChange() {
    setState(() {
      isCanSubmit = formKey.currentState?.validate() ?? false;
    });
  }

  _onFieldSubmittedPassword() {
    focusNodeConfirmPassword.requestFocus();
  }
}
