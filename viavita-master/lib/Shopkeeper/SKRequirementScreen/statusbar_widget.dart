import 'package:flutter/material.dart';

class StatusBadgeWidget extends StatelessWidget {
  final String text;
  final Color bgColor;
    final Color textColor;


  const StatusBadgeWidget({
    super.key,
    required this.text,
    required this.bgColor, required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 24,
      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          text,
          style:  TextStyle(
            fontSize: 12,
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}