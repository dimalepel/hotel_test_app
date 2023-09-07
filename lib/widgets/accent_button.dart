import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class AccentButton extends StatelessWidget {
  final String label;
  final Function() onTap;

  const AccentButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.blue
        ),
        height: 48,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                fontFamily: 'San Francisco',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.white
            ),
          ),
        ),
      ),
    );
  }
}
