import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonWidgets/filledbuttonwidget.dart';
import 'package:via_vita_mobile_app/CommonWidgets/unfilledbuttonwidget.dart';
import 'package:via_vita_mobile_app/Worker/Shop/screen.dart';
import 'package:via_vita_mobile_app/color/newcolors.dart';



class RequirementsWidget extends StatefulWidget {
  const RequirementsWidget({super.key});

  @override
  State<RequirementsWidget> createState() => _RequirementsWidgetState();
}

class _RequirementsWidgetState extends State<RequirementsWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    final outlineborder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: mediaquery.height * 0.02),
            Container(
              height: mediaquery.height * 0.06,
              width: double.infinity,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/back_arrow.png',
                          height: 12,
                          width: 6,
                        ),
                        SizedBox(width: mediaquery.width * 0.05),
                        Text(
                          'Requirements',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: mediaquery.height * 0.04,
                      width: mediaquery.width*.25,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.buttonShade1,
                            AppColors.buttonShade2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/add.png',
                               scale: 5,
                            ),
                            Text(
                              'Add',
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: mediaquery.height * 0.03),

            Text(
              'Description',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(height: mediaquery.height * 0.01),
            TextFormField(
              maxLines: null,
              minLines: 6,
              decoration: InputDecoration(
                hintText: 'Description',
                filled: true,
                fillColor: AppColors.textfieldbg,
                border: outlineborder,
                enabledBorder: outlineborder,
                focusedBorder: outlineborder,
              ),
            ),

  SizedBox(height: mediaquery.height * 0.03),

  Flexible(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       UnfilledButtonWidget(buttontext: 'Save', buttonwidth: 160, buttonheight: 55),
       FilledButtonWidget(buttontext: 'Edit', buttonwidth: 160, buttonheight: 55)
    
      ],
    ),
  )

          ],
        ),
        
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GestureDetector(
            onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:  (context) => WorkerShopWidget()));
      },
          child: FilledButtonWidget(buttontext: 'Save', buttonwidth: 390, buttonheight: 55)),
      ),
    );
  }
}
