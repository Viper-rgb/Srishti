import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/ShopKeeper/CustomWidgets/accepted_task_widget.dart';



class UnfilledButtonWidget extends StatelessWidget {
  final String buttontext;
  final double buttonwidth;
  final double buttonheight;

  const UnfilledButtonWidget({
    super.key, 
    required this.buttontext, 
    required this.buttonwidth,
    required this.buttonheight});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AcceptedTaskWidget(),
                          ),
                        );
      },
      child: Container(
           width: buttonwidth,
           height: buttonheight,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [colors.app_color_1,colors.app_color_2],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [colors.app_color_1,colors.app_color_2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Center(
                    child:  Text(
                      buttontext,
                      style: TextStyle(
                        fontSize: 14,
                       fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
    )
;
  }
}