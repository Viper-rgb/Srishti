import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonWidgets/appbarwidget.dart';
import 'package:via_vita_mobile_app/Worker/CustomWidgts/plan_widget.dart';
import 'package:via_vita_mobile_app/color/newcolors.dart';



class SubscriptionPlanWidget extends StatelessWidget {
  const SubscriptionPlanWidget({super.key});

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
                  children: [
                    PlansWidget(
                      planName: 'Free Plan',
                      content:
                          'Unlock exclusive features and enjoy an ad-free experience. ',
                      price: '0',
                      cycle: '3+ Months',
                      buttonText: 'Free',
                      showButton: true,
                      containerwidth: 390,
                      containerheight: 226, onTap: () {  },
                    ),
                    SizedBox(height: mediaquery.height * 0.01),
                    PlansWidget(
                      planName: '3+ Months Plan',
                      content:
                          'Unlock exclusive features and enjoy an ad-free experience. ',
                      price: '₹600',
                      cycle: 'Monthly',
                      buttonText: 'pay ₹600/Month',
                      showButton: true,
                      containerwidth: 390,
                      containerheight: 226, onTap: () {  },
                    ),
                    SizedBox(height: mediaquery.height * 0.01),

                    PlansWidget(
                      planName: 'Yearly Plan',
                      content:
                          'Unlock exclusive features and enjoy an ad-free experience. ',
                      price: '₹500/Month',
                      cycle: 'Yearly',
                      buttonText: 'pay ₹3,000/Year',
                      showButton: true,
                      containerwidth: 390,
                      containerheight: 226, onTap: () {  },
                    ),
                    SizedBox(height: mediaquery.height * 0.02),
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
