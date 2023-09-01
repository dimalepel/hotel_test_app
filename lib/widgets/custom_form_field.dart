import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class CustomFormField extends StatelessWidget {
  final String label;

  const CustomFormField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      ),
    );
  }
}
