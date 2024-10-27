import 'package:flutter/material.dart';

class CheckboxSaveLoginWidget extends StatelessWidget {
  final bool isCheck;
  final VoidCallback callbackSave;
  final VoidCallback callbackForgotPassword;

  const CheckboxSaveLoginWidget(
      {super.key,
      this.isCheck = false,
      required this.callbackSave,
      required this.callbackForgotPassword});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: isCheck,
              onChanged: (value) => callbackSave.call(),
            ),
            const Text(
              'Lưu đăng nhập',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => callbackForgotPassword.call(),
              child: const Text(
                'Quên mật khẩu',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
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
