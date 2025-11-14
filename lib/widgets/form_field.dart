import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;

  final String labelText;
  final String? Function(String?)? validator;
  final bool? obscureText;

  const CustomFormField({
    super.key,
    this.controller,
    this.labelText = 'Enter value',
    this.validator,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      obscureText: obscureText ?? false,
      validator:
          validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
