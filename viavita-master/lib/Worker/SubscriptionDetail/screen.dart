import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonWidgets/appbarwidget.dart';
import 'package:via_vita_mobile_app/CommonWidgets/filledbuttonwidget.dart';
import 'package:via_vita_mobile_app/CommonWidgets/textfieldwidget.dart';
import 'package:via_vita_mobile_app/Worker/CustomWidgts/plan_widget.dart';
import 'package:via_vita_mobile_app/Worker/Requirements/screen.dart';
import 'package:via_vita_mobile_app/color/newcolors.dart';



class SubscriptionDetailWidget extends StatefulWidget {
  const SubscriptionDetailWidget({super.key});

  @override
  State<SubscriptionDetailWidget> createState() =>
      _SubscriptionDetailWidgetState();
}

class _SubscriptionDetailWidgetState extends State<SubscriptionDetailWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
        child: Column(
          children: [
            SizedBox(height: mediaquery.height * 0.02),
            AppBarWidget(title: 'Subscription'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: mediaquery.height * 0.02),
                    PlansWidget(
                      planName: 'Yearly Plan',
                      content:
                          'Unlock exclusive features and enjoy an ad-free experience. ',
                      price: '₹500/Month',
                      cycle: 'Yearly',
                      buttonText: 'pay ₹3,000/Year',
                      showButton: false,containerwidth: 390, containerheight: 190, onTap: () {  },
                    ),
                    SizedBox(height: mediaquery.height * 0.05),
                    TextformfieldWidget(title: 'Cardholder Name', hint: 'Name'),
                    SizedBox(height: mediaquery.height * 0.02),
                    TextformfieldWidget(
                      title: 'Card Number',
                      hint: 'xxxx xxxx xxxx',
                    ),
                    SizedBox(height: mediaquery.height * 0.02),
                    Row(
                      children: [
                        Expanded(
                          child: TextformfieldWidget(title: 'CVV', hint: '678'),
                        ),
                        SizedBox(width: mediaquery.width * 0.05),
                        Expanded(
                          child: TextformfieldWidget(
                            title: 'Expiry Date',
                            hint: '12/12/2027',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: mediaquery.height * 0.05),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequirementsWidget(),
                          ),
                        );
                      },
                      child: 
                             FilledButtonWidget(buttontext:  'Pay ₹3,000/-', buttonwidth: 390, buttonheight: 55,),
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
