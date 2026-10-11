// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
// import 'package:via_vita_mobile_app/CommonScreens/images.dart';
// import 'package:via_vita_mobile_app/CommonScreens/onboard_screen.dart';
// import 'package:via_vita_mobile_app/Customer/Screens/Customer_BottomNavigation/customer_bottom_screen.dart';
// import 'package:via_vita_mobile_app/ShopKeeper/ShopBottom/shop_bottom_screen.dart';
// import 'package:via_vita_mobile_app/Worker/WokerBottom/worker_bottom_screen.dart';

// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});

//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }

// class _SplashscreenState extends State<Splashscreen> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
//       precacheImage(AssetImage(Images.app_logo), context);
//       autoRoute();
//     });
//     super.initState();
//   }

//   // Future<void> autoRoute() async {
//   //   await Future.delayed(Duration(milliseconds: 1500));
//   //   Navigator.pushReplacement(
//   //     context,
//   //     MaterialPageRoute(builder: (context) =>OnBoardScreen()),
//   //   );
//   // }
//   Future<void> autoRoute() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
//   String? role = prefs.getString('role');

//   if (isLoggedIn && role != null) {
//     if (role == 'customer') {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CustomerBottomScreen()));
//     } else if (role == 'worker') {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WorkerBottomscreen()));
//     } else if (role == 'shopkeeper') {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShopBottomNavigationSCreen()));
//     }
//   } else {
//         Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) =>OnBoardScreen()),
//     );
//     // Navigate to Onboarding or Login selection screen
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     final Size    displaysize=MediaQuery.of(context).size;
//     return Scaffold(
//         backgroundColor: colors.background_color,
//       body: Container(
//         decoration: BoxDecoration(color: Colors.white),
//         child: Center(child: Image.asset(Images.app_logo, 
//         height: displaysize.height * .23,
//          )),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/CommonScreens/onboard_screen.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Customer_BottomNavigation/customer_bottom_screen.dart';
import 'package:via_vita_mobile_app/ShopKeeper/ShopBottom/shop_bottom_screen.dart';
import 'package:via_vita_mobile_app/Worker/WokerBottom/worker_bottom_screen.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    // Start the routing logic after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(AssetImage(Images.app_logo), context);
      autoRoute();
    });
  }

  Future<void> autoRoute() async {
    // 1. Start a timer (e.g., 2.5 seconds) so the splash screen stays visible
    // 2. Simultaneously start fetching SharedPreferences
    final List<dynamic> results = await Future.wait([
      Future.delayed(const Duration(milliseconds: 2500)), // Adjust time as needed
      SharedPreferences.getInstance(),
    ]);

    final SharedPreferences prefs = results[1];
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    String? role = prefs.getString('role');

    // Safety check: ensure the widget is still in the tree before navigating
    if (!mounted) return;

    if (isLoggedIn && role != null) {
      if (role == 'customer') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CustomerBottomScreen()));
      } else if (role == 'worker') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const WorkerBottomscreen()));
      } else if (role == 'shopkeeper') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ShopBottomNavigationSCreen()));
      } else {
        // Fallback if role is unknown
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardScreen()));
      }
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size displaysize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white, // Ensure this matches your design
      body: Center(
        child: Image.asset(
          Images.app_logo,
          height: displaysize.height * .23,
        ),
      ),
    );
  }
}