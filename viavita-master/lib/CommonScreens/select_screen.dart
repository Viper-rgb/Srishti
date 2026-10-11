import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Login/login_screen.dart';
import 'package:via_vita_mobile_app/ShopKeeper/ShopKeeperLogin/shopkeeper_login_screen.dart';
import 'package:via_vita_mobile_app/Worker/WorkerLogin/worker_login_screen.dart';




class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.background_color,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(child: Image.asset(Images.app_logo,scale: 2)),const SizedBox(height: 40),
              Center(
                child: const Text(
                  'Sign up your account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              _buildAccountOption(
                context,
                image: Appicons.customer_icon,
                label: 'Customer Login',
                color: colors.app_color_2,
                onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CustomerLoginScreen()));

                }
              ),  const SizedBox(height: 16),
              _buildAccountOption(
                context,
                image: Appicons.worker_icon,
                label: 'Worker Access',
                color:colors.app_color_2,
                onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WorkerLoginScreen()));
                }
              ),
              const SizedBox(height: 16),
              _buildAccountOption(
                context,
                image: Appicons.shop_icon,
                label: 'Shop Owner',
                color: colors.app_color_2,
                onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ShopkeeperLoginScreen()));


                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountOption(BuildContext context, {required String image, required String label, required Color color,required Function() onTap}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap:onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Row(
              children: <Widget>[
                Image.asset(image,scale: 4,),
                const SizedBox(width: 20),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}