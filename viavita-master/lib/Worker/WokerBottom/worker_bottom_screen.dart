import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/Worker/WokerHome/worker_home_screen.dart';
import 'package:via_vita_mobile_app/Worker/WorkerMyTask/worker_my_task_screen.dart';
import 'package:via_vita_mobile_app/Worker/WorkerProfile/worker_profile_screen.dart';
import 'package:via_vita_mobile_app/Worker/WorkerTask/worker_task_screen.dart';


class WorkerBottomscreen extends StatefulWidget {
  const WorkerBottomscreen({super.key});

  @override
  State<WorkerBottomscreen> createState() => _WorkerBottomscreenState();
}

class _WorkerBottomscreenState extends State<WorkerBottomscreen> {
  int selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
WorkerHomeScreen(),
WorkerTaskScreen(),
WorkerMyTaskScreen(),
WorkerProfileScreen()
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
                image: Appicons.my_task_icon,
                index: 2,
                name: 'My Tasks',
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
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
