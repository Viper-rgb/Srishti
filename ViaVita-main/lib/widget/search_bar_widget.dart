import 'package:flutter/material.dart';
import 'package:workers_app/Appimage.dart';
import 'package:workers_app/colors/colors.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search here...",
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        prefixIcon: Image.asset(
          Appicons.search_icon,
          scale: 5,
        ),
        suffixIcon: Image.asset(
          Appicons.filter_icon,
          scale: 5,
        ),
        filled: true,
        fillColor: colors.form_field_color,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
