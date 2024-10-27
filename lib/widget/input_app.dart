import 'package:flutter/material.dart';

class InputApp extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String title;
  final GlobalKey<FormState> formKey;
  final FormFieldValidator<String>? validator;


  const InputApp({
    required this.controller,
    super.key,
    this.hintText = '',
    required this.title, required this.formKey, this.validator,
  });

  @override
  State<InputApp> createState() => _InputAppState();
}

class _InputAppState extends State<InputApp> {

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
