import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/color/colors.dart';


class WorkerResetPasswordScreen extends StatefulWidget {
  const WorkerResetPasswordScreen({super.key});

  @override
  State<WorkerResetPasswordScreen> createState() => _WorkerResetPasswordScreenState();
}

class _WorkerResetPasswordScreenState extends State<WorkerResetPasswordScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

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
            Center(child: Text('Reset Password',style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,fontWeight: FontWeight.w500
                ),)),
                 const SizedBox(height: 32),
             Center(
               child: Text(
                'Enter your new password',style: TextStyle(color: Colors.black),
                
                           ),
             ),
            const SizedBox(height: 32),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                  suffixIcon: Image.asset(Appicons.eye_icon,scale: 4.5)
                // suffixIcon: IconButton(
                //   icon: Icon(
                //     _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                //     color: Colors.grey,
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       _isPasswordVisible = !_isPasswordVisible;
                //     });
                //   },
                // ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Confirm Password',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                suffixIcon: Image.asset(Appicons.eye_icon,scale: 4.5)
                // suffixIcon: IconButton(
                //   icon: Icon(
                //     _isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                //     color: Colors.grey,
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                //     });
                //   },
                // ),
              ),
            ),
            const SizedBox(height: 48),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                gradient: const LinearGradient(
                  colors: [
                   colors.app_color_1,colors.app_color_2
                  ],
                
                ),
              ),
             child: Center(
               child: Text(
                    'Confirm',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
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

