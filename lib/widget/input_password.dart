import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/common/ultils/regex.dart';

class InputPasswordWidget extends StatefulWidget {
  final VoidCallback showPassword;
  final bool isShowPassword;
  final String hintText;
  final String title;
  final String? error;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  const InputPasswordWidget({
    super.key,
    this.hintText = '',
    required this.title,
    required this.showPassword,
    this.isShowPassword = false,
    this.error,
    required this.controller,
    required this.formKey,
  });

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Form(
          key: widget.formKey,
          child: TextFormField(
            controller: widget.controller,
            validator: _validator,
            obscureText: widget.isShowPassword,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                onTap: () => widget.showPassword.call(),
                child: Icon(
                  widget.isShowPassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                  color: Colors.black.withOpacity(0.5),
                  size: 20,
                ),
              ),
              hintText: widget.hintText,
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
        ),
      ],
    );
  }

  String? _validator(String? value) {
    if ((value == null || value.isEmpty)) {
      return 'Mật khẩu không được để trống';
    }
    if (!RegexInput.regex.hasMatch(value)) {
      return 'Sai định dạng mật khẩu';
    }
    return widget.error;
  }
}
