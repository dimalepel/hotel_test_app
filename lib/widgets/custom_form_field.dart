import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../themes/app_colors.dart';

class CustomFormField extends StatefulWidget {
  final String label;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? formatters;
  final String? hint;
  final bool? req;
  final String? val;
  final void Function(String?)? save;
  final void Function()? onTap;
  final controller;

  const CustomFormField({
    super.key,
    required this.label,
    this.validator,
    this.formatters,
    this.hint,
    this.req = false,
    this.val,
    this.save,
    this.onTap,
    this.controller
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool isValid = true;
  late bool? reqIn;

  @override
  void initState() {
    reqIn = widget.req;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (reqIn! && (value == null || value.isEmpty)) {
          setState(() {
            isValid = false;
          });
          return '';
        } else {
          setState(() {
            isValid = true;
          });
        }

        return null;
      },
      controller: widget.controller,
      initialValue: widget.val,
      inputFormatters: widget.formatters,
      style: TextStyle(
          color: AppColors.blackInput,
          fontSize: 16,
          fontFamily: 'San Francisco',
          fontWeight: FontWeight.w400
      ),
      onSaved: widget.save,
      onTap: widget.onTap,
      decoration: InputDecoration(
        isCollapsed: true,
        contentPadding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
          bottom: 10
        ),
        filled: true,
        fillColor: isValid ? AppColors.greyAlt : AppColors.red15,
        labelText: widget.label,
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
        hintText: widget.hint,
        errorStyle: TextStyle(height: 0)
      ),
    );
  }
}
