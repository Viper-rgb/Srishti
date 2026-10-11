import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/CommonScreens/select_screen.dart';
import 'package:via_vita_mobile_app/color/colors.dart';


class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                Images.onboard_image, // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
            // Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black54, // Adjust opacity as needed
                      Colors.black87, // Adjust opacity as needed
                    ],
                    stops: [0.4, 0.7, 1.0], // Adjust stops to control gradient spread
                  ),
                ),
              ),
            ),
            // Content (Text and Button)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Status Bar (Placeholder for actual status bar)
                  const SizedBox(height: 30), // Adjust as needed for actual status bar
                
                  const Spacer(), // Pushes content to the bottom
                  const Text(
                    'Your Home, Our Care',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'From plumbing to painting, we bring trusted professionals right to your doorstep. Book, track, and manage all your home needs in just a few taps',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Get Started Button
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        
                        print('Get Started tapped!');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Make background transparent
                        padding: EdgeInsets.zero, // Remove default padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.transparent, // Remove shadow
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                             colors.app_color_1,colors.app_color_2
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child:  Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10),
                               Row(
                                children: [
                                  Image.asset(Appicons.arrow_icon,scale: 4,)
                                ],
                               )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}