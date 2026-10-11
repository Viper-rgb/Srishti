import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';



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
        hintStyle:  TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color:Colors.black
                    ),
        // contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        prefixIcon:Image.asset(
         Appicons.search_icon,
         scale: 5,
        ),
        suffixIcon: Image.asset(
       Appicons.filter_icon,
         scale: 5,
        ),
    
        filled: true,
        fillColor: colors.form_field_color,
        border: OutlineInputBorder(
    borderSide: BorderSide.none,
        ),
      ),
    );
  }
}