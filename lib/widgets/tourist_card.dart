import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../themes/app_colors.dart';
import 'custom_form_field.dart';

class TouristCard extends StatefulWidget {
  final String labelText;
  final List<Widget> children;

  const TouristCard({super.key, required this.labelText, required this.children});

  @override
  State<TouristCard> createState() => _TouristCardState();
}

class _TouristCardState extends State<TouristCard> {
  var isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.white,
      ),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 8),
      child: ExpansionTile(
        onExpansionChanged: (bool expanded) {
          setState(() => isExpanded = expanded);
        },
        trailing: Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
              color: AppColors.blue10,
              borderRadius: BorderRadius.circular(6)
          ),
          child: Center(
            child: RotatedBox(
              quarterTurns: (isExpanded) ? 3 : 1,
              child: SvgPicture.asset(
                'assets/images/svgs/icon_chewron_right.svg',
                width: 24,
                height: 24,
                colorFilter: ColorFilter.mode(
                    AppColors.blue,
                    BlendMode.srcIn
                ),
              ),
            ),
          ),
        ),
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        title: Text(
          widget.labelText,
          style: TextStyle(
              fontFamily: 'San Francisco',
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: AppColors.black
          ),
        ),
        children: widget.children,
      ),
    );
  }
}
