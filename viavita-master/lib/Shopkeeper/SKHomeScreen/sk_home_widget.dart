import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/CommonWidgets/filledbuttonwidget.dart';
import 'package:via_vita_mobile_app/Shopkeeper/CustomWidgets/shop_menu_widget.dart';
import 'package:via_vita_mobile_app/Shopkeeper/SKHomeScreen/home_appbarwidget.dart';
import 'package:via_vita_mobile_app/color/newcolors.dart';



class SKHomePageWidget extends StatefulWidget {
  const SKHomePageWidget({super.key});

  @override
  State<SKHomePageWidget> createState() => _SKHomePageWidgetState();
}

class _SKHomePageWidgetState extends State<SKHomePageWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;


    return Scaffold(
      backgroundColor: AppColors.white,

      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50.0),
        child: Column(
          children: [
            HomeAppBarWidget(
              name: 'Ashmi A B',
              imgUrl:Images.profile_image,
            ),

             SizedBox(height: mediaquery.height * 0.03),
                    SKHomeMenuWidgets(
                      icondata:Appicons.new_icon,
                      title: 'New Requirements', count: '12',
                    ),
                    SizedBox(height: mediaquery.height * 0.008),
                    SKHomeMenuWidgets(
                      icondata: Appicons.accept_icon,
                      title: 'Accepted Requirements', count: '35',
                    ),
                    SizedBox(height: mediaquery.height * 0.008),
                    SKHomeMenuWidgets(
                      icondata: Appicons.pending_icon,
                      title: 'Pending Requirements', count: '18',
                    ),

                    SizedBox(height: mediaquery.height * 0.04),

                     FilledButtonWidget(buttontext: 'View All Requirements', buttonwidth: 390, buttonheight: 55),
          ],
        ),
      ),
    );
  }
}