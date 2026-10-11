import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/color/newcolors.dart';



class WorkerInfoWidget extends StatelessWidget {
  final String icondata;
  final String title;
  final String data;

  const WorkerInfoWidget({
    super.key,
    required this.icondata,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return Container(
      width: 390,
      height: 78,
      decoration: BoxDecoration(shape: BoxShape.rectangle),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: AppColors.iconbg,
            child: Image.asset(icondata,scale: 5,),
          ),
          SizedBox(width: mediaquery.width * 0.05),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppColors.captionColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: mediaquery.height * 0.005),

              Text(
                data,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
