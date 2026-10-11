import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/Worker/CustomWidgts/app_bar_widget.dart';
import 'package:via_vita_mobile_app/Worker/CustomWidgts/filled_button_widget.dart';
import 'package:via_vita_mobile_app/Worker/CustomWidgts/text_form_widget.dart';



class AcceptedTaskWidget extends StatefulWidget {
  const AcceptedTaskWidget({super.key});

  @override
  State<AcceptedTaskWidget> createState() => _AcceptedTaskWidgetState();
}

class _AcceptedTaskWidgetState extends State<AcceptedTaskWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    final cardtextstyle = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: colors.app_color_1,
    );

    final outlineborder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    );

    return Scaffold(
      backgroundColor: colors.background_color,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
        child: Column(
          children: [
            SizedBox(height: mediaquery.height * 0.02),
            AppBarWidget(title: 'Accepted Tasks'),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: mediaquery.height * 0.05),
                    Text('Job Category', style: cardtextstyle),
                    SizedBox(height: mediaquery.height * 0.005),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(
                        hintText: 'Select Job Category',
                        filled: true,
                        suffixIcon: Icon(Icons.arrow_drop_down),
                        fillColor: colors.app_color_1,
                        border: outlineborder,
                        enabledBorder: outlineborder,
                        // focusedBorder: outlineborder,
                      ),
                    ),
                    SizedBox(height: mediaquery.height * 0.02),
                    TextformfieldWidget(title: 'Customer Name', hint: 'Name'),
                                        SizedBox(height: mediaquery.height * 0.02),

                     Text(
              'Job Description',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: colors.app_color_1,
              ),
            ),
            SizedBox(height: mediaquery.height * 0.005),
            TextFormField(
              maxLines: null,
              minLines: 3,
              decoration: InputDecoration(
                hintText: 'Description',
                hintStyle: TextStyle(fontSize: 14),
                filled: true,
                fillColor: colors.app_color_1,
                border: outlineborder,
                enabledBorder: outlineborder,
                focusedBorder: outlineborder,
              ),
            ),
 SizedBox(height: mediaquery.height * 0.02),
 TextformfieldWidget(title: 'Location', hint: "location"),
  SizedBox(height: mediaquery.height * 0.02),
 TextformfieldWidget(title: 'Estimated Budget', hint: "₹2,000/-"),
  SizedBox(height: mediaquery.height * 0.02),
 TextformfieldWidget(title: 'Expected Days for Completion', hint: "3 Days"),
   SizedBox(height: mediaquery.height * 0.02),
 TextformfieldWidget(title: 'Status', hint: "Updated"),
    SizedBox(height: mediaquery.height * 0.05),
FilledButtonWidget(buttontext: 'Save Changes', buttonwidth: 390, buttonheight: 55,onTap: () {
  
},),
    SizedBox(height: mediaquery.height * 0.05),

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
