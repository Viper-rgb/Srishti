import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/color/newcolors.dart';



class HomeAppBarWidget extends StatelessWidget {
  final String name;
  final String imgUrl;
  const HomeAppBarWidget({super.key, required this.name, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    return Container(
      width: 390,
      height: 55,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [
                CircleAvatar(radius: 25, foregroundImage: NetworkImage(imgUrl)),
                SizedBox(width: mediaquery.width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hello,',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.captionColor,
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Image.asset('assets/notification_icon.png', scale: 5),
          ],
        ),
      ),
    );
  }
}
