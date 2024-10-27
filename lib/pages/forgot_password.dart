import 'package:flutter/material.dart';
import 'package:gym_app/widget/button_app.dart';
import 'package:gym_app/widget/input_app.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> usernameFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: const Text(
            'Quên mật khẩu',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            InputApp(
              validator: _validator,
              formKey: usernameFormKey,
              controller: usernameController,
              hintText: 'Tên tài khoản',
              title: 'Tên tài khoản',
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ButtonElevatedApp(
                title: 'Quên mật khẩu',
                callback: () => _submitForgotPassword(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validator(String? value) {
    return (value == null || value.isEmpty) ? 'Tên tài khoản không được để trống' : null;
  }

  _submitForgotPassword() {
    final validateUsername = usernameFormKey.currentState?.validate() ?? false;
    if (validateUsername) {}
  }
}
