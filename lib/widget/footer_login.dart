import 'package:flutter/material.dart';

class FooterLoginWidget extends StatelessWidget {
  final VoidCallback callback;
  final bool isLogin;

  const FooterLoginWidget(
      {super.key, required this.callback, this.isLogin = true});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(isLogin ? 'Bạn chưa có tài khoản?' : 'Đã có tài khoản?',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: theme.textTheme.titleSmall),
        const SizedBox(
          width: 8,
        ),
        GestureDetector(
          onTap: () => callback.call(),
          child: Text(isLogin ? 'Đăng ký ngay' : 'Đăng nhập ngay',
              textAlign: TextAlign.center,
              maxLines: 2,
              style: theme.textTheme.titleSmall?.copyWith(color: Colors.red)),
        ),
      ],
    );
  }
}
