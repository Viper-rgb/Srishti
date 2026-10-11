import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/color/newcolors.dart';



class FilledButtonWidget extends StatelessWidget {
  final String buttontext;
  final double buttonwidth;
  final double buttonheight;
  
  const FilledButtonWidget({
    super.key,
    required this.buttontext,
    required this.buttonwidth,
    required this.buttonheight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      //  Navigator.push(context, MaterialPageRoute(builder:  (context) => SubscriptionDetailWidget()));
      },
      child: Container(
        width: buttonwidth,
        height: buttonheight,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.buttonShade1, AppColors.buttonShade2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      
        child: Center(
          child: Text(
            buttontext,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}