import 'package:flutter/material.dart';

class InputAppUserNameWidget extends StatefulWidget {
  final ValueChanged<String?> onChange;
  final String hintText;
  final String title;

  const InputAppUserNameWidget({
    super.key,
    required this.onChange,
    this.hintText = '',
    required this.title,
  });

  @override
  State<InputAppUserNameWidget> createState() => _InputAppUserNameWidgetState();
}

class _InputAppUserNameWidgetState extends State<InputAppUserNameWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 8,
        ),
        Form(
          key: formKey,
          child: TextFormField(
            validator: _validator,
            onChanged: (value) => _setChange(value),
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

  String? _validator(String? value) {
    return value == null ||  value.isEmpty ? 'Tên tài khoản không được để trống' : null;
  }

  _setChange(String? value) {
    widget.onChange.call(value);
    final bool isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
  }
}
