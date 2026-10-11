import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/color/newcolors.dart';



class TextformfieldWidget extends StatefulWidget {
  final String title;
  final String hint;

  const TextformfieldWidget({
    super.key,
    required this.title,
    required this.hint,
  });

  @override
  State<TextformfieldWidget> createState() => _TextformWidgetState();
}

class _TextformWidgetState extends State<TextformfieldWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    final cardtextstyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.textColor,
    );

    final outlineborder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: cardtextstyle),
        SizedBox(height: mediaquery.height * 0.005),
        TextFormField(
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: TextStyle(fontSize: 14),
            filled: true,
            fillColor: AppColors.textfieldbg,
            border: outlineborder,
            enabledBorder: outlineborder,
            focusedBorder: outlineborder,
          ),
        ),
      ],
    );
  }
}