import 'package:flutter/material.dart';

class InputApp extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String title;
  final GlobalKey<FormState> formKey;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;


  const InputApp({
    required this.controller,
    super.key,
    this.hintText = '',
    required this.title, 
    required this.formKey, 
    this.validator, 
    this.focusNode, 
    this.textInputAction,
  });

  @override
  State<InputApp> createState() => _InputAppState();
}

class _InputAppState extends State<InputApp> {

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
        Form(
          key: widget.formKey,
          child: TextFormField(
            textInputAction: widget.textInputAction,
            focusNode: widget.focusNode,
            controller: widget.controller,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.hintText,
              helperStyle: const TextStyle(
                color: Colors.red,
              ),
              hintStyle: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 16,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
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
}
