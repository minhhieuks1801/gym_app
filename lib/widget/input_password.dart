import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPasswordWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChange;
  final VoidCallback showPassword;
  final bool isShowPassword;
  final String? error;
  final String hintText;
  final String title;

  const InputPasswordWidget({
    super.key,
    required this.controller,
    required this.onChange,
    this.error,
    this.hintText = '',
    required this.title,
    required this.showPassword,
    this.isShowPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          onChanged: (value) => onChange.call(value),
          obscureText: isShowPassword,
          decoration: InputDecoration(
            suffixIcon: InkWell(
              onTap: () => showPassword.call(),
              child: Icon(
                isShowPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                color: Colors.black.withOpacity(0.5),
                size: 20,
              ),
            ),
            hintText: hintText,
            errorText: error,
            hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.5),
              fontSize: 16,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
