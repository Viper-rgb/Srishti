// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
// import 'package:via_vita_mobile_app/CommonScreens/images.dart';
// import 'package:via_vita_mobile_app/Customer/Screens/Detail/detail_screen.dart';
// import 'package:via_vita_mobile_app/DataModels/task_model.dart';

// import 'package:via_vita_mobile_app/Providers/cutomer_viewall_taskprovider.dart';
// import 'package:via_vita_mobile_app/Providers/profile_provider.dart';



// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       loadInitialData();
//     });
//   }

//   // Combined data loader
//   void loadInitialData() async {
//     final prefs = await SharedPreferences.getInstance();
//     final customerId = prefs.getString("customer_id");

//     if (customerId != null && mounted) {
//       // 1. Fetch Profile
//       Provider.of<ProfileProvider>(context, listen: false).fetchProfile(customerId);
      
//       // 2. Fetch Tasks using the correct Provider
//       Provider.of<CutomerViewallTaskprovider>(context, listen: false)
//           .fetchNewCustomerViewallTasks(customerId);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: colors.background_color,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 const HeaderSection(),
//                 const SizedBox(height: 20),
//                 const SearchBarContainer(),
//                 const SizedBox(height: 30),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text('Your Pending Tasks', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
//                     IconButton(
//                       icon: const Icon(Icons.refresh),
//                       onPressed: loadInitialData, // Refresh using current ID
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 15),

//                 // USE CutomerViewallTaskprovider HERE
//                 Consumer<CutomerViewallTaskprovider>(
//                   builder: (context, taskProvider, child) {
//                     if (taskProvider.isLoading) {
//                       return const Center(child: CircularProgressIndicator());
//                     }

//                     if (taskProvider.errorMessage.isNotEmpty) {
//                       return Center(child: Text(taskProvider.errorMessage, style: const TextStyle(color: colors.app_color_1,fontSize: 13)));
//                     }

//                     if (taskProvider.tasks.isEmpty) {
//                       return const Center(child: Text("No new tasks found."));
//                     }

//                     return GridView.builder(
//                       shrinkWrap: true, // Important inside SingleChildScrollView
//                       physics: const NeverScrollableScrollPhysics(),
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 15,
//                         crossAxisSpacing: 15,
//                         childAspectRatio: 1.1, // Adjusted for content
//                       ),
//                       itemCount: taskProvider.tasks.length,
//                       itemBuilder: (context, index) {
//                         final task = taskProvider.tasks[index];
//                         return TaskCard(
//                           id:task.taskId ,
//                           title: task.categoryname,
//                           status: task.description,
//                           price: '₹ ${task.budget}',
//                           isPending: true,
//                           deadline: task.deadlineDate,
//                           description: task.description,
//                           location: task.location,
//                           categoryid: task.jobCategory,
                          
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// class HeaderSection extends StatelessWidget {
//   const HeaderSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final profile = Provider.of<ProfileProvider>(context);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: <Widget>[
//         Row(
//           children: <Widget>[
//             CircleAvatar(
//               radius: 25,
//               backgroundImage: NetworkImage(   profile.profile?.avatar ?? "Guest", ),
//               backgroundColor: Colors.grey,
//             ),
//             const SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children:  <Widget>[
//                 Text(
//                   'Hello,',
//                   style: TextStyle(fontSize: 14, color: Colors.black54),
//                 ),
//                 Text(
//                     profile.profile?.name ?? "Guest", 
//                   style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//      //   Image.asset(Appicons.notification_icon, scale: 4)
//       ],
//     );
//   }
// }

// class SearchBarContainer extends StatelessWidget {
//   const SearchBarContainer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//       decoration: BoxDecoration(
//         color: colors.form_field_color,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         children: <Widget>[
//           Image.asset(Appicons.search_icon, scale: 4),
//           const SizedBox(width: 10),
//           Expanded(
//             child: TextFormField(
//               decoration: const InputDecoration(
//                 hintText: 'Search here...',
//                 border: InputBorder.none,
//                 hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
//               ),
//             ),
//           ),
         
//         ],
//       ),
//     );
//   }
// }

// class TaskCard extends StatelessWidget {
//   final String id;
//   final String title;
//   final String status;
//   final String price;
//   final bool isPending;
//   final String deadline; 
//   final String location;
//   final String description;
//   final String categoryid;


//   const TaskCard({
//     super.key,
//       required this.id,
//     required this.title,
//     required this.status,
//     required this.price,
//     required this.isPending,
//     required this.deadline, required this.location, required this.description, required this.categoryid,
  

//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       // width: 170, // Not needed in GridView usually
//      color: colors.task_list_color,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 // Description
//                 Text(
//                   status,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: Colors.black54,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   price,
//                   style: const TextStyle(
//                     fontSize: 12,
//                     color: colors.app_color_1,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 if (deadline != null) ...[
//                   const SizedBox(height: 2),
//                   Text(
//                     "Due: $deadline",
//                     style: const TextStyle(fontSize: 10, color: Colors.grey),
//                   ),
//                 ],
//                 const SizedBox(height: 10),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskDetailScreen(
//                       title: title, 
//                       budget: price, 
//                       location: location, 
//                       deadline: deadline, 
//                       description: description,
//                       categoryid: categoryid,
//                       id: id,
//                       )));
                    
//                   },
//                   child: Container(
//                     height: 35, // Slightly smaller to fit grid
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       gradient: LinearGradient(
//                         colors: [colors.app_color_1, colors.app_color_2],
//                       ),
//                     ),
//                     child: Center(
//                       child: Text(
//                         'View Details',
//                         style: TextStyle(
//                           color: colors.background_color,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 12
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/images.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Detail/detail_screen.dart';
import 'package:via_vita_mobile_app/DataModels/task_model.dart';

import 'package:via_vita_mobile_app/Providers/cutomer_viewall_taskprovider.dart';
import 'package:via_vita_mobile_app/Providers/profile_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadInitialData();
    });
  }

  void loadInitialData() async {
    final prefs = await SharedPreferences.getInstance();
    final customerId = prefs.getString("customer_id");

    if (customerId != null && mounted) {
      Provider.of<ProfileProvider>(context, listen: false).fetchProfile(customerId);
      Provider.of<CutomerViewallTaskprovider>(context, listen: false)
          .fetchNewCustomerViewallTasks(customerId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.background_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const HeaderSection(),
                const SizedBox(height: 20),
                const SearchBarContainer(), // Search bar is here
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Your Pending Tasks', 
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: loadInitialData,
                    )
                  ],
                ),
                const SizedBox(height: 15),

                // Listens to the Provider
                Consumer<CutomerViewallTaskprovider>(
                  builder: (context, taskProvider, child) {
                    if (taskProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (taskProvider.errorMessage.isNotEmpty) {
                      return Center(child: Text(taskProvider.errorMessage, 
                        style: const TextStyle(color: colors.app_color_1, fontSize: 13)));
                    }

                    // CRITICAL CHANGE: Use filteredTasks instead of tasks
                    final displayedTasks = taskProvider.filteredTasks;

                    if (displayedTasks.isEmpty) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("No tasks found for this category."),
                        ),
                      );
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 1.2, // Slightly increased to prevent overflow
                      ),
                      itemCount: displayedTasks.length,
                      itemBuilder: (context, index) {
                        final task = displayedTasks[index];
                        return TaskCard(
                          id: task.taskId,
                          title: task.categoryname,
                          status: task.description,
                          price: '₹ ${task.budget}',
                          isPending: true,
                          deadline: task.deadlineDate,
                          description: task.description,
                          location: task.location,
                          categoryid: task.jobCategory,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            CircleAvatar(
              radius: 25,
              backgroundImage: profile.profile?.avatar != null 
                ? NetworkImage(profile.profile!.avatar!) 
                : null,
              backgroundColor: Colors.grey,
              child: profile.profile?.avatar == null ? const Icon(Icons.person) : null,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Hello,', style: TextStyle(fontSize: 14, color: Colors.black54)),
                Text(
                  profile.profile?.name ?? "Guest",
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class SearchBarContainer extends StatelessWidget {
  const SearchBarContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: colors.form_field_color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(Appicons.search_icon, scale: 4),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                // Call the search function in Provider as the user types
                Provider.of<CutomerViewallTaskprovider>(context, listen: false)
                    .setSearchQuery(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search by category...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String id;
  final String title;
  final String status;
  final String price;
  final bool isPending;
  final String deadline;
  final String location;
  final String description;
  final String categoryid;

  const TaskCard({
    super.key,
    required this.id,
    required this.title,
    required this.status,
    required this.price,
    required this.isPending,
    required this.deadline,
    required this.location,
    required this.description,
    required this.categoryid,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: colors.task_list_color,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              status,
              style: const TextStyle(fontSize: 12, color: Colors.black54),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
             const SizedBox(height: 10), 
            Text(
              price,
              style: const TextStyle(
                  fontSize: 12, color: colors.app_color_1, fontWeight: FontWeight.w500),
            ),
              Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskDetailScreen(
                              title: title,
                              budget: price,
                              location: location,
                              deadline: deadline,
                              description: description,
                              categoryid: categoryid,
                              id: id,
                            )));
              },
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(
                    colors: [colors.app_color_1, colors.app_color_2],
                  ),
                ),
                child: const Center(
                  child: Text(
                    'View Details',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}