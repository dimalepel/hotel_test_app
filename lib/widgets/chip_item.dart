import 'package:flutter/material.dart';

import '../themes/app_colors.dart';

class ChipItem extends StatelessWidget {
  final String label;

  const ChipItem({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      labelPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      label: Text(
        label,
        style: TextStyle(
            fontFamily: 'San Francisco',
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColors.greyDark
        ),
      ),
      backgroundColor: AppColors.grey,
    );
  }
}
