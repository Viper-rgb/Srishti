import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/Customer/Screens/ForgetPassword/forget_password_screen.dart';
import 'package:via_vita_mobile_app/bottom.dart';
import 'package:via_vita_mobile_app/color/colors.dart';
import 'package:via_vita_mobile_app/screens/RegisterScreen/register_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final displaysize=MediaQuery.of(context).size;
    return Scaffold(
     backgroundColor: colors.background_color,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 80.0,),
         
              Center(
                child: const Text(
                  'Sign in your account',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 48.0),

             
              const Text(
                'Email ID',
                style: TextStyle(
                fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              _buildTextInputField(
                hintText: 'Email ID',
                
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24.0),

            
              const Text(
                'Password',
                style: TextStyle(
                 fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              _buildTextInputField(
                hintText: 'Password',
                isPassword: true,
              ),
              const SizedBox(height: 8.0),

            
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                    debugPrint('Forgot Password Pressed');
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),

           
             
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavigationScreen()));
                },
                child: Container(
                  height: 55,
                  width: 390,
                  decoration: BoxDecoration(gradient: LinearGradient(colors: [colors.app_color_1,colors.app_color_2]),borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text('Sign in',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
              const SizedBox(height: 40.0),

        
              Row(
                children: const <Widget>[
                  Expanded(child: Divider(color: Colors.black26,indent: 70,)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Or', style: TextStyle(color: Colors.black54)),
                  ),
                  Expanded(child: Divider(color: Colors.black26,endIndent: 70,)),
                ],
              ),
              const SizedBox(height: 30.0),

           
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   SizedBox(
                                    height: displaysize.height * .03,  width: displaysize.height * .03,
                                    
                                    child: Image.asset(Images.google_image),
                                  ),
                  // _buildSocialButton(
                  //   context: context,
                  //   label: 'Google',
                  //   icon: 'assets/google_logo.png', // You need to add this image to your assets
                  //   onTap: () {
                  //     debugPrint('Sign in with Google');
                  //   },
                  // ),
                  const SizedBox(width: 30.0),
                     SizedBox(
                                    height: displaysize.height * .04,
                                    width: displaysize.height * .03,
                                    child: Image.asset(Images.facebook_image),
                                  ),
                  // _buildSocialButton(
                  //   context: context,
                  //   label: 'Facebook',
                  //   icon: 'assets/facebook_logo.png',
                  //   onTap: () {
                  //     debugPrint('Sign in with Facebook');
                  //   },
                  // ),
                ],
              ),
              const SizedBox(height: 60.0),

              // Don't have an account? Sign Up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 Text(
                    "Don't have an account ? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>CreateAccountScreen()));
                      // Handle navigation to the sign-up screen
                      debugPrint('Sign Up Pressed');
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,decoration: TextDecoration.underline,
                        color: Colors.black87,
                        
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widget Builders ---
  Widget _buildTextInputField({
    required String hintText,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: isPassword,
      style: TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14),
        filled: true,
        fillColor: colors.form_field_color, // Light grey background
        suffixIcon: isPassword
            ? Image.asset(Appicons.eye_icon,scale: 4,)
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none, // No border visible
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color(0xFF386641), // Focus border color
            width: 2.0,
          ),
        ),
      ),
    );
  }

  // Custom Social Button with Image and Label
  Widget _buildSocialButton({
    required BuildContext context,
    required String label,
    required String icon,
    required VoidCallback onTap,
  }) {
    // Note: To use actual Google/Facebook logos, you must add them to your 'assets' folder
    // and reference them correctly (e.g., 'assets/google_logo.png').
    // I'm using placeholder icons for this runnable code.
    IconData placeholderIcon = label == 'Google' ? Icons.search : Icons.facebook;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            // Replacing Image.asset with a placeholder Icon for runnable code
            child: Icon(
              placeholderIcon,
              size: 30,
              color: label == 'Google' ? Colors.red : Colors.blue,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}