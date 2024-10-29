import 'package:flutter/material.dart';
import 'package:gym_app/widget/input_app.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController usernameController;

  late GlobalKey<FormState> usernameFormKey;
  late FocusNode focusNodeUsername;

  @override
  void initState() {
    usernameController = TextEditingController();
    usernameFormKey = GlobalKey<FormState>();
    focusNodeUsername = FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text('Quên mật khẩu', style: theme.textTheme.labelMedium),
          centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            InputApp(
              focusNode: focusNodeUsername,
              validator: _validator,
              formKey: usernameFormKey,
              controller: usernameController,
              hintText: 'Tên tài khoản',
              title: 'Tên tài khoản',
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () => _submitForgotPassword(),
              child: Text(
                'Quên mật khẩu',
                style:
                    theme.textTheme.titleMedium?.copyWith(color: Colors.white),
              ),
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

  _submitForgotPassword() {
    final validateUsername = usernameFormKey.currentState?.validate() ?? false;
    if (validateUsername) {
    } else {
      focusNodeUsername.requestFocus();
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    focusNodeUsername.dispose();
    super.dispose();
  }
}
