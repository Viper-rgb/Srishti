import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Profile/profile_screen.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Task/add_task_screen.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Task/task_screen.dart';
import 'package:via_vita_mobile_app/color/colors.dart';
import 'package:via_vita_mobile_app/screens/HomeScreen/home_screen.dart';
import 'package:via_vita_mobile_app/screens/OfferScreen/offer_screen.dart';


class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    TaskAppScreen(),
    TasksScreen(customerId: '',),
    OffersScreen(),
    ProfileScreen()
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
                image: Appicons.task_icon,
                index: 1,
                name: 'Tasks',
                onTap: () => onTapped(1),
              ),
              bottomFields(
                image: Appicons.offer_icon,
                index: 2,
                name: 'Offers',
                onTap: () => onTapped(2),
              ),
              bottomFields(
                image: Appicons.profile_bottom_icon,
                index: 3,
                name: 'Profile',
                onTap: () => onTapped(3),
              ),
            ],
          ),
      ),
      floatingActionButton: ClipOval(
        
        child: Material(
          
          color: colors.app_color_2,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTasksScreen()));
            },
            child: SizedBox(height: 52,width: 52,
            child: Icon(Icons.add,color: colors.background_color,),
            ),

          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      
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
