import 'package:flutter/material.dart';

class InputAppWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChange;
  final String? error;
  final String hintText;
  final String title;

  const InputAppWidget({
    super.key,
    required this.controller,
    required this.onChange,
    this.error,
    this.hintText = '',
    required this.title,
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
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          onChanged: (value) => onChange.call(value),
          decoration: InputDecoration(
            hintText: hintText,
            errorText: error,
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
      ],
    );
  }
}
