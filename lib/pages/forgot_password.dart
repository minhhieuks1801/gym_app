import 'package:flutter/material.dart';
import 'package:gym_app/widget/button_app.dart';
import 'package:gym_app/widget/input_app_user_name.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String username = '';

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
            InputAppUserNameWidget(
              hintText: 'Tên tài khoản',
              onChange: (value) => _setUsername(
                value: value,
              ),
              title: 'Tên tài khoản',
            ),
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ButtonApp(
                title: 'Quên mật khẩu',
                callback: () => _submitForgotPassword(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? validateUserName(){
    return username.isEmpty ? 'Không được để trống' : null;
  }

  _setUsername({String? value}) {
    setState(() {
      username = value??"";
    });
  }

  _submitForgotPassword() {}
}
