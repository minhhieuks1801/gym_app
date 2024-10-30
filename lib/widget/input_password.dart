import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPasswordWidget extends StatefulWidget {
  final VoidCallback showPassword;
  final bool isShowPassword;
  final String hintText;
  final String title;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String> changeValuePassword;
  final VoidCallback? onFieldSubmitted;

  const InputPasswordWidget({
    super.key,
    this.hintText = '',
    required this.title,
    required this.showPassword,
    this.isShowPassword = false,
    required this.controller,
    this.validator,
    this.focusNode,
    this.textInputAction,
    required this.changeValuePassword,
    this.onFieldSubmitted,
  });

  @override
  State<InputPasswordWidget> createState() => _InputPasswordWidgetState();
}

class _InputPasswordWidgetState extends State<InputPasswordWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: theme.textTheme.labelMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          textInputAction: widget.textInputAction,
          onFieldSubmitted: (value) => widget.onFieldSubmitted?.call(),
          focusNode: widget.focusNode,
          controller: widget.controller,
          validator: widget.validator,
          onChanged: (value) => widget.changeValuePassword(value),
          obscureText: widget.isShowPassword,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () => widget.showPassword.call(),
              icon: Icon(
                !widget.isShowPassword
                    ? CupertinoIcons.eye
                    : CupertinoIcons.eye_slash,
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
      ],
    );
  }
}
