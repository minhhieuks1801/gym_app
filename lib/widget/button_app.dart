import 'package:flutter/material.dart';

class ButtonElevatedApp extends StatelessWidget {
  final Color background;
  final Color colorText;
  final String title;
  final VoidCallback callback;

  const ButtonElevatedApp({
    super.key,
    this.background = Colors.blue,
    this.colorText = Colors.white,
    required this.title,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: () => callback.call(),
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(background),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            (RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: colorText,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
