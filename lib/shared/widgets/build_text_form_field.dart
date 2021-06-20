import 'package:flutter/material.dart';

class BuildTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validate;
  final bool isPassword;
  final bool isClickable;
  final String label;
  final IconData prefix;
  final IconData? suffix;

  const BuildTextFormField({
    required this.controller,
    required this.type,
    this.onSubmit,
    this.onChange,
    this.onTap,
    required this.validate,
    this.isPassword = false,
    this.isClickable = true,
    required this.label,
    required this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isClickable,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null ? Icon(suffix) : null,
        border: OutlineInputBorder(),
      ),
    );
  }
}
