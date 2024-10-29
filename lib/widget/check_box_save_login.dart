import 'package:flutter/material.dart';

class CheckboxSaveLoginWidget extends StatelessWidget {
  final bool isValueCheckbox;
  final VoidCallback callbackSave;
  final VoidCallback callbackForgotPassword;

  const CheckboxSaveLoginWidget(
      {super.key,
      this.isValueCheckbox = false,
      required this.callbackSave,
      required this.callbackForgotPassword});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: isValueCheckbox,
              onChanged: (value) => callbackSave.call(),
            ),
            Text(
              'Lưu đăng nhập',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: theme.textTheme.titleSmall,
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => callbackForgotPassword.call(),
              child: Text(
                'Quên mật khẩu',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: theme.textTheme.titleSmall,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        )
      ],
    );
  }
}
