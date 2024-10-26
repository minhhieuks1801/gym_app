import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  final Color colorBorder;
  final Color background;
  final Color colorText;
  final String title;
  final VoidCallback callback;

  const ButtonApp({
    super.key,
    this.colorBorder = Colors.blue,
    this.background = Colors.blue,
    this.colorText = Colors.white,
    required this.title,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        border: Border.all(color: colorBorder, width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          color: colorText,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
