import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/CommonScreens/onboard_screen.dart';
import 'package:via_vita_mobile_app/color/colors.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    WidgetsBinding.instance.scheduleFrameCallback((timeStamp) {
      precacheImage(AssetImage(Images.app_logo), context);
      autoRoute();
    });
    super.initState();
  }

  Future<void> autoRoute() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>OnBoardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size    displaysize=MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: colors.background_color,
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(child: Image.asset(Images.app_logo, 
        height: displaysize.height * .23,
         )),
      ),
    );
  }
}
