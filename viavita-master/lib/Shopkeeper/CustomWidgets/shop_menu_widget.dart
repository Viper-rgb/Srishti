import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';



class SKHomeMenuWidgets extends StatelessWidget {
  final String icondata;
  final String title;
  final String count;

  const SKHomeMenuWidgets({
    super.key,
    required this.icondata,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 78,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colors.container_color
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: colors.container_circle_color,
                  child: Image.asset(icondata, scale: 5),
                ),
                SizedBox(width: mediaquery.width * 0.05),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color:Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),

                    Text(
                      count,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
     
            
          ],
        ),
      ),
    );
  }
}