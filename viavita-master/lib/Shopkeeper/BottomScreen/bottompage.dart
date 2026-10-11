import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Profile/profile_screen.dart';
import 'package:via_vita_mobile_app/Shopkeeper/SKHomeScreen/sk_homescreen.dart';
import 'package:via_vita_mobile_app/Shopkeeper/SKRequirementScreen/sk_requirementscreen.dart';
import 'package:via_vita_mobile_app/color/colors.dart';


class ShopBottomNavigationSCreen extends StatefulWidget {
  const ShopBottomNavigationSCreen({super.key});

  @override
  State<ShopBottomNavigationSCreen> createState() => _ShopBottomNavigationSCreenState();
}

class _ShopBottomNavigationSCreenState extends State<ShopBottomNavigationSCreen> {
  int selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    SKHomePageWidget(),
    SKRequirementsWidget(),
    ProfileScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.background_color,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomFields(
                image: Appicons.home_icon,
                index: 0,
                name: 'Home',
                onTap: () => onTapped(0),
              ),
              bottomFields(
                image: Appicons.requirements_icon,
                index: 1,
                name: 'Requirements',
                onTap: () => onTapped(1),
              ),
             
              bottomFields(
                image: Appicons.profile_bottom_icon,
                index: 2,
                name: 'Profile',
                onTap: () => onTapped(2),
              ),
            ],
          ),
      ),
      
    );
  }

  Widget bottomFields({
    required String image,
    required String name,
    required int index,
    required Function() onTap,
  }) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      splashColor: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            scale: 5,
            color: isSelected ? colors.app_color_1 : Colors.grey,
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? colors.app_color_1 : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
