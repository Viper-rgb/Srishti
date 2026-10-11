import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/CommonWidgets/appbarwidget.dart';
import 'package:via_vita_mobile_app/CommonWidgets/filledbuttonwidget.dart';
import 'package:via_vita_mobile_app/CommonWidgets/unfilledbuttonwidget.dart';
import 'package:via_vita_mobile_app/Shopkeeper/CustomWidgets/status_bar_widget.dart';
import 'package:via_vita_mobile_app/color/newcolors.dart';



class SKRequirementsWidget extends StatefulWidget {
  const SKRequirementsWidget({super.key});

  @override
  State<SKRequirementsWidget> createState() => _SKRequirementsWidgetState();
}

class _SKRequirementsWidgetState extends State<SKRequirementsWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    final outlineborder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.textfieldborder, width: 1),
    );

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
        child: Column(
          children: [
            SizedBox(height: mediaquery.height * 0.02),
            AppBarWidget(title: 'Requiements'),
            SizedBox(height: mediaquery.height * 0.05),

            Container(
              width: 390,
              height: 387,
              decoration: BoxDecoration(
                color: AppColors.containerbg,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: mediaquery.height * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Plumbing',
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        StatusBadgeWidget(
                          text: 'Pending',
                          bgColor: AppColors.badgebg,
                          textColor: AppColors.badgeTextColor,
                        ),
                      ],
                    ),
                
                    SizedBox(height: mediaquery.height * 0.02),
                    Row(
                      children: [
                        Image.asset(
                          Appicons.wallet_icon,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: mediaquery.width * 0.02),
                        Text(
                          'Fix plumbing issues in building A',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.captionColorDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaquery.height * 0.01),
                    Row(
                      children: [
                        Image.asset(
                          Appicons.map_icon,
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(width: mediaquery.width * 0.02),
                        Text(
                          'Location - Coimbatore',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.captionColorDark,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: mediaquery.height * 0.03),
                    Text(
                      'Estimate',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor,
                      ),
                    ),
                    SizedBox(height: mediaquery.height * 0.006),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Ente an estimate',
                        hintStyle: TextStyle(fontSize: 14),
                        filled: true,
                        fillColor: AppColors.textfieldbg,
                        border: outlineborder,
                        enabledBorder: outlineborder,
                        focusedBorder: outlineborder,
                      ),
                    ),
                    SizedBox(height: mediaquery.height * 0.05),
                
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          UnfilledButtonWidget(
                            buttontext: 'Reject',
                            buttonwidth: 160,
                            buttonheight: 55,
                          ),
                          FilledButtonWidget(
                            buttontext: 'Accept',
                            buttonwidth: 160,
                            buttonheight: 55,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}