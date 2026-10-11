import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/Worker/WorkerForgetPasswordScreen/resetforgetpasswordscreen.dart';
import 'package:via_vita_mobile_app/color/colors.dart';



class WorkerForgetpasswordscreen extends StatefulWidget {
  const WorkerForgetpasswordscreen({super.key});

  @override
  State<WorkerForgetpasswordscreen> createState() => _WorkerForgetpasswordscreenState();
}

class _WorkerForgetpasswordscreenState extends State<WorkerForgetpasswordscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.background_color,
     
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50), // Adjust spacing as needed
            Center(
              child: const Text(
                'Forget Password?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: const Text(
                'Enter your E-Mail below to receive your password reset instruction',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Email ID',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child:  TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email ID',
                  hintStyle: TextStyle(fontSize: 13),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                   colors.app_color_1,colors.app_color_2
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>WorkerResetPasswordScreen()));
                    // Handle Next button press
                    print('Next button pressed');
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

