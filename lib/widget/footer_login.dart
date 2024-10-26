import 'package:flutter/material.dart';

class FooterLoginWidget extends StatelessWidget {
  final VoidCallback callback;
  final bool isLogin;

  const FooterLoginWidget({super.key, required this.callback, this.isLogin = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLogin ? 'Bạn chưa có tài khoản?' : 'Đã có tài khoản?',
          textAlign: TextAlign.center,
          maxLines: 2,
          style: const TextStyle(
            color: Colors.teal,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        InkWell(
          onTap: () => callback.call(),
          child: Text(
            isLogin ? 'Đăng ký ngay' : 'Đăng nhập ngay',
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
