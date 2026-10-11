// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
// import 'package:via_vita_mobile_app/CommonScreens/images.dart';
// import 'package:via_vita_mobile_app/Providers/shop_profile_provider.dart';
// import 'package:via_vita_mobile_app/ShopKeeper/CustomWidgets/shop_menu_widget.dart';
// import 'package:via_vita_mobile_app/Worker/CustomWidgts/filled_button_widget.dart';
// import 'package:via_vita_mobile_app/Worker/CustomWidgts/home_app_bar_widget.dart';


// class ShopHomeScreen extends StatefulWidget {
//   const ShopHomeScreen({super.key});

//   @override
//   State<ShopHomeScreen> createState() => _ShopHomeScreenState();
// }

// class _ShopHomeScreenState extends State<ShopHomeScreen> {
//     @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) { 
//     loadProfileData();  
//     });
//   }
//     void loadProfileData() async {
//     final prefs = await SharedPreferences.getInstance();
//     final shopId = prefs.getString("id");

//     // FIX 1: Check if customerId is null before using it
//     if (shopId != null && mounted) {
//       Provider.of<ShopProfileProvider>(context, listen: false)
//           .fetchShopProfile(shopId);
//     } else {
//       print("Error: Shop ID not found in SharedPreferences");
//       // Optional: Redirect to login if ID is missing
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaquery = MediaQuery.of(context).size;
//     final profile = Provider.of<ShopProfileProvider>(context);


//     return Scaffold(
//       backgroundColor: colors.background_color,

//       body: Padding(
//         padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50.0),
//         child: Column(
//           children: [
//             HomeAppBarWidget(
//               name: profile.profile?.name??"",
//              imgUrl: ''
//             ),

//              SizedBox(height: mediaquery.height * 0.03),
//                     SKHomeMenuWidgets(
//                       icondata: Appicons.requirements_icon,
//                       title: 'New Requirements', count: '12',
//                     ),
//                     SizedBox(height: mediaquery.height * 0.008),
//                     SKHomeMenuWidgets(
//                       icondata: Appicons.accept_icon,
//                       title: 'Accepted Requirements', count: '35',
//                     ),
//                     SizedBox(height: mediaquery.height * 0.008),
//                     SKHomeMenuWidgets(
//                       icondata: Appicons.pending_icon,
//                       title: 'Pending Requirements', count: '18',
//                     ),

//                     SizedBox(height: mediaquery.height * 0.04),

//                      FilledButtonWidget(buttontext: 'View All Requirements', buttonwidth: 390, buttonheight: 55,onTap: () {
                       
//                      },),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ... existing imports ...
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/Providers/shop_profile_provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_requirementcount_provider.dart';
import 'package:via_vita_mobile_app/ShopKeeper/CustomWidgets/shop_menu_widget.dart';
import 'package:via_vita_mobile_app/ShopKeeper/ShopRequirements/shop_requirement_screen.dart';
import 'package:via_vita_mobile_app/Worker/CustomWidgts/filled_button_widget.dart';
import 'package:via_vita_mobile_app/Worker/CustomWidgts/home_app_bar_widget.dart';


class ShopHomeScreen extends StatefulWidget {
  const ShopHomeScreen({super.key});

  @override
  State<ShopHomeScreen> createState() => _ShopHomeScreenState();
}

class _ShopHomeScreenState extends State<ShopHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadProfileData();
    });
  }

  void loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final shopId = prefs.getString("id");

    if (shopId != null && mounted) {
      // Fetch Profile Data
      Provider.of<ShopProfileProvider>(context, listen: false)
          .fetchShopProfile(shopId);
      
      // FETCH REQUIREMENT COUNTS HERE
      Provider.of<ShopRequirementcountProvider>(context, listen: false)
          .fetchRequirementCount(shopId);
    } else {
      print("Error: Shop ID not found in SharedPreferences");
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;
    final profile = Provider.of<ShopProfileProvider>(context);
    
    // Access the Requirement Provider
    final reqProvider = Provider.of<ShopRequirementcountProvider>(context);
    final counts = reqProvider.counts;

    return Scaffold(
      backgroundColor: colors.background_color,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50.0),
        child: Column(
          children: [
            HomeAppBarWidget(
              name: profile.profile?.name ?? "",
              imgUrl: '',
            ),
            SizedBox(height: mediaquery.height * 0.03),

            // Use dynamic data from reqProvider
            SKHomeMenuWidgets(
              icondata: Appicons.requirements_icon,
              title: 'New Requirements', 
              count: counts?['new']?.toString() ?? '0', // API Key: "new"
            ),
            SizedBox(height: mediaquery.height * 0.008),
            
            SKHomeMenuWidgets(
              icondata: Appicons.accept_icon,
              title: 'Accepted Requirements', 
              count: counts?['accepted']?.toString() ?? '0', // API Key: "accepted"
            ),
            SizedBox(height: mediaquery.height * 0.008),
            
            SKHomeMenuWidgets(
              icondata: Appicons.pending_icon,
              title: 'Pending Requirements', 
              count: counts?['pending']?.toString() ?? '0', // API Key: "pending"
            ),

            SizedBox(height: mediaquery.height * 0.04),
            FilledButtonWidget(
              buttontext: 'View All Requirements',
              buttonwidth: 390,
              buttonheight: 55,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AllRequirementsScreen()));
              },
            ),
            
            // Optional: Show loading indicator if still loading
            if (reqProvider.isLoading)
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: LinearProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}