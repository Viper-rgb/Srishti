import 'package:flutter/material.dart';
import 'package:workers_app/Appimage.dart';
import 'package:workers_app/screens/worker_home_screen.dart';
import 'package:workers_app/screens/worker_my_task_screen.dart';
import 'package:workers_app/screens/worker_profile_screen.dart';
import 'package:workers_app/screens/worker_task_screen.dart';
import 'package:workers_app/colors/colors.dart';


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
    final bool showBottomNav = selectedIndex != 3;

    return Scaffold(
      backgroundColor: colors.background_color,
      body: pages[selectedIndex],
      bottomNavigationBar: showBottomNav
          ? BottomAppBar(
              height: 65,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
            )
          : null,
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
      child: SizedBox(
        width: 58,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 22,
              height: 22,
              fit: BoxFit.contain,
              color: isSelected ? colors.app_color_1 : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 10.5,
                color: isSelected ? colors.app_color_1 : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
