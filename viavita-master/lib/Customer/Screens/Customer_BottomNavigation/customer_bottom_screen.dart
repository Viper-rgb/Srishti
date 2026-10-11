// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart'; // 1. Import Provider
// import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
// import 'package:via_vita_mobile_app/CommonScreens/images.dart';
// import 'package:via_vita_mobile_app/Customer/Screens/Bookings/bookings_screen.dart';
// import 'package:via_vita_mobile_app/Customer/Screens/Home/home_screen.dart';
// import 'package:via_vita_mobile_app/Customer/Screens/Profile/profile_screen.dart';
// import 'package:via_vita_mobile_app/Customer/Screens/Task/add_task_screen.dart';
// import 'package:via_vita_mobile_app/Customer/Screens/Task/task_screen.dart';
// import 'package:via_vita_mobile_app/Providers/booking_provider.dart';


// // 2. Import your Profile Provider (Adjust path as needed)
// import 'package:via_vita_mobile_app/Providers/profile_provider.dart';
// import 'package:via_vita_mobile_app/Providers/view_estimate_provider.dart'; 

// class CustomerBottomScreen extends StatefulWidget {
//   const CustomerBottomScreen({super.key});

//   @override
//   State<CustomerBottomScreen> createState() => _CustomerBottomScreenState();
// }

// class _CustomerBottomScreenState extends State<CustomerBottomScreen> {
//   int selectedIndex = 0;

//   void onTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   // NOTE: 'pages' list is removed from here because we need 'context' to get the ID.

//   @override
//   Widget build(BuildContext context) {
//   // final profileProvider = Provider.of<ProfileProvider>(context);
//   // final bookingprovider=Provider.of<ViewEstimateProvider>(context);
   
    
//   //   // 2. Get Customer ID (for TasksScreen)
//   //   String currentCustomerId = profileProvider.profile?.id?.toString() ?? '';
//   // int currentTaskId = bookingprovider.estimates?['task_id'] ?? 22; // Default to 2 or 0
    

//   //   // 4. Define pages using the dynamic ID
//   //   final List<Widget> pages = [
//   //     const HomeScreen(),
//   //     TasksScreen(customerId: currentCustomerId),
//   //     // Pass the dynamic integer ID here
//   //     BookingScreen(taskId:currentTaskId), 
//   //     const ProfileScreen()
//   //   ];
//   // 1. Providers
//     final profileProvider = Provider.of<ProfileProvider>(context);
//     final bookingProvider = Provider.of<ViewEstimateProvider>(context);

//     // 2. Get Customer ID
//     String currentCustomerId = profileProvider.profile?.id?.toString() ?? '';

//     // 3. Get Task ID safely
//     // We check if estimates exists, then try to parse the ID. 
//     // Default to 0 (or 22) if nothing is selected.
//     int currentTaskId = 22; // Default fallback
    
//     if (bookingProvider.estimates != null && 
//         bookingProvider.estimates is Map &&
//         (bookingProvider.estimates as Map).containsKey('task_id')) {
        
//         // Safely convert to int even if API returns "22" (String) or 22 (int)
//         var idFromApi = bookingProvider.estimates.taskId;
//         currentTaskId = int.tryParse(idFromApi.toString()) ?? 22;
//     }

//     // 4. Define pages
//     final List<Widget> pages = [
//       const HomeScreen(),
//       TasksScreen(customerId: currentCustomerId),
      
//       // Pass the Task ID here
//       BookingScreen(taskId: currentTaskId), 
      
//       const ProfileScreen()
//     ];

//     return Scaffold(
//       backgroundColor: colors.background_color,
//       body: pages[selectedIndex],
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               bottomFields(
//                 image: Appicons.home_icon,
//                 index: 0,
//                 name: 'Home',
//                 onTap: () => onTapped(0),
//               ),
//               bottomFields(
//                 image: Appicons.task_icon,
//                 index: 1,
//                 name: 'Tasks',
//                 onTap: () => onTapped(1),
//               ),
//               bottomFields(
//                 image: Appicons.offer_icon,
//                 index: 2,
//                 name: 'Bookings',
//                 onTap: () => onTapped(2),
//               ),
//               bottomFields(
//                 image: Appicons.profile_bottom_icon,
//                 index: 3,
//                 name: 'Profile',
//                 onTap: () => onTapped(3),
//               ),
//             ],
//           ),
//       ),
//       floatingActionButton: ClipOval(
//         child: Material(
//           color: colors.app_color_2,
//           child: InkWell(
//             onTap: () {
//              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTasksScreen()));
//             },
//             child: SizedBox(height: 52,width: 52,
//             child: Icon(Icons.add,color: colors.background_color,),
//             ),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }

//   Widget bottomFields({
//     required String image,
//     required String name,
//     required int index,
//     required Function() onTap,
//   }) {
//     final bool isSelected = selectedIndex == index;

//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(10),
//       splashColor: Colors.transparent,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset(
//             image,
//             scale: 5,
//             color: isSelected ? colors.app_color_1 : Colors.grey,
//           ),
//           const SizedBox(height: 5),
//           Text(
//             name,
//             style: TextStyle(
//               fontSize: 12,
//               color: isSelected ? colors.app_color_1 : Colors.grey,
//               fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 1. Import Provider
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Bookings/bookings_screen.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Home/home_screen.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Profile/profile_screen.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Task/add_task_screen.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Task/task_screen.dart';



// 2. Import your Profile Provider (Adjust path as needed)
import 'package:via_vita_mobile_app/Providers/profile_provider.dart';
import 'package:via_vita_mobile_app/Providers/view_estimate_provider.dart'; 

class CustomerBottomScreen extends StatefulWidget {
  const CustomerBottomScreen({super.key});

  @override
  State<CustomerBottomScreen> createState() => _CustomerBottomScreenState();
}

class _CustomerBottomScreenState extends State<CustomerBottomScreen> {
  int selectedIndex = 0;

  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // NOTE: 'pages' list is removed from here because we need 'context' to get the ID.

  @override
  Widget build(BuildContext context) {
  // final profileProvider = Provider.of<ProfileProvider>(context);
  // final bookingprovider=Provider.of<ViewEstimateProvider>(context);
   
    
  //   // 2. Get Customer ID (for TasksScreen)
  //   String currentCustomerId = profileProvider.profile?.id?.toString() ?? '';
  // int currentTaskId = bookingprovider.estimates?['task_id'] ?? 22; // Default to 2 or 0
    

  //   // 4. Define pages using the dynamic ID
  //   final List<Widget> pages = [
  //     const HomeScreen(),
  //     TasksScreen(customerId: currentCustomerId),
  //     // Pass the dynamic integer ID here
  //     BookingScreen(taskId:currentTaskId), 
  //     const ProfileScreen()
  //   ];
  // 1. Providers
    final profileProvider = Provider.of<ProfileProvider>(context);
    final bookingProvider = Provider.of<ViewEstimateProvider>(context);

    // 2. Get Customer ID
    String currentCustomerId = profileProvider.profile?.id?.toString() ?? '';

    // 3. Get Task ID safely
    // We check if estimates exists, then try to parse the ID. 
    // Default to 0 (or 22) if nothing is selected.
    int currentTaskId = 22; // Default fallback
    
    if (bookingProvider.estimates != null && bookingProvider.estimates!.isNotEmpty) {
        // Safely convert to int even if API returns "22" (String) or 22 (int)
        var idFromApi = bookingProvider.estimates!.first.taskId;
        currentTaskId = int.tryParse(idFromApi.toString()) ?? 22;
    }

    // 4. Define pages
    final List<Widget> pages = [
      const HomeScreen(),
      TasksScreen(customerId: currentCustomerId),
      
      // Pass the Task ID here
      BookingScreen(taskId: currentTaskId), 
      
      const ProfileScreen()
    ];

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
                name: 'Bookings',
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
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}