import 'package:flutter/material.dart';
import 'package:gym_app/widget/input_app.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late TextEditingController usernameController;

  late GlobalKey<FormState> formKey;
  late FocusNode focusNodeUsername;
  bool isCanSubmit = false;

  @override
  void initState() {
    usernameController = TextEditingController();
    formKey = GlobalKey<FormState>();
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
        child: Form(
          key: formKey,
          child: Column(
            children: [
              InputApp(
                focusNode: focusNodeUsername,
                textInputAction: TextInputAction.done,
                validator: _validator,
                changeValue: (value) => _onChange(),
                onFieldSubmitted: () => _submitForgotPassword(),
                controller: usernameController,
                hintText: 'Tên tài khoản',
                title: 'Tên tài khoản',
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: isCanSubmit ? () => _submitForgotPassword() : null,
                child: const Text(
                  'Quên mật khẩu',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validator(String? value) {
    return (value == null || value.isEmpty)
        ? 'Tên tài khoản không được để trống'
        : null;
  }

  _submitForgotPassword() {}

  @override
  void dispose() {
    usernameController.dispose();
    focusNodeUsername.dispose();
    super.dispose();
  }

  _onChange() {
    setState(() {
      isCanSubmit = formKey.currentState?.validate() ?? false;
    });
  }
}
