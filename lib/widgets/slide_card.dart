import 'package:flutter/material.dart';

class SlideCard extends StatelessWidget {
  final String imagePath;

  const SlideCard({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        imagePath,
        height: 257,
        fit: BoxFit.cover,
      ),
    );
  }
}
