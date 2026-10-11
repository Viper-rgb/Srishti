import 'package:flutter/material.dart';
import 'package:workers_app/colors/colors.dart';

class FilledButtonWidget extends StatelessWidget {
  final String buttontext;
  final double buttonwidth;
  final double buttonheight;
  final Function()? onTap;

  const FilledButtonWidget({
    super.key,
    required this.buttontext,
    required this.buttonwidth,
    required this.buttonheight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonwidth,
        height: buttonheight,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [colors.app_color_1, colors.app_color_2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttontext,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
