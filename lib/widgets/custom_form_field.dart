import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../themes/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatters;
  final String? hint;

  const CustomFormField({super.key, required this.label, this.validator, this.formatters, this.hint});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      inputFormatters: formatters,
      style: TextStyle(
          color: AppColors.blackInput,
          fontSize: 16,
          fontFamily: 'San Francisco',
          fontWeight: FontWeight.w400
      ),
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
          bottom: 10
        ),
        filled: true,
        fillColor: AppColors.greyAlt,
        labelText: label,
        labelStyle: TextStyle(
            fontFamily: 'San Francisco',
            fontSize: 17,
            fontWeight: FontWeight.w400,
            color: AppColors.greyPlaceholder
        ),
        floatingLabelStyle: TextStyle(
            height: 6,
            color: AppColors.greyPlaceholder
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hint
      ),
    );
  }
}
