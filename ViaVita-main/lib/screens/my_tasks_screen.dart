import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workers_app/detail/accepttask_worker_detail_screen.dart';
import 'package:workers_app/detail/completed_task_detailscreen.dart';
import 'package:workers_app/detail/in_progress_task_detail.screen.dart';
import 'package:workers_app/detail/in_progress_task_provider.dart';
import 'package:workers_app/provider/AcceptedTaskProvider.dart';
import 'package:workers_app/provider/complete_task_provider.dart';
import 'package:workers_app/provider/worker_profile_provider.dart';
import 'package:workers_app/screens/customer-task.dart';
import 'package:workers_app/screens/profile_screen.dart';

class MyTasksScreen extends StatefulWidget {
 
  const MyTasksScreen({super.key});

  @override
  State<MyTasksScreen> createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {

  // Future<void> taskscreenUpdate(
  //   String jobCategory,
  //   String categoryName,
  //   String description,
  //   String location,
  //   String budget,
  // ) async {
  //   // TODO: implement API call
  // }

  // int _selectedTab = 0; // 0: Accepted Task, 1: In Progress, 2: Completed
  
  
   final int _currentIndex = 2;

  // final List<String> _tabs = ['Accepted Task', 'In Progress', 'Completed'];

  

  // final List<Map<String, String>> _allTasks = [ 
  //   {
  //     'title': 'Masonry',
  //     'price': '₹12,000/-',
  //     'location': '123 Street, TVM',
  //     'description': 'Carpenter is currently building and assembling the wardrobe and shelves...',
  //     'status': 'Accepted Task',
  //   },
  //   {
  //     'title': 'Electrical Work',
  //     'price': '₹21,000/-',
  //     'location': '123 Street, TVM',
  //     'description': 'Living room rewiring and installation of ceiling fans and lights needed...',
  //     'status': 'Accepted Task',
  //   },
  //   {
  //     'title': 'Appliance Repair',
  //     'price': '₹35,000/-',
  //     'location': '123 Street, TVM',
  //     'description': 'Technician is checking the AC unit and repairing parts...',
  //     'status': 'Accepted Task',
  //   },
  //   {
  //     'title': 'Plumbing Services',
  //     'price': '₹8,500/-',
  //     'location': '456 Avenue, TVM',
  //     'description': 'Fixing water pipeline leaks and replacing bathroom fittings...',
  //     'status': 'In Progress',
  //   },
  //   {
  //     'title': 'Wall Painting',
  //     'price': '₹18,000/-',
  //     'location': '789 Main Rd, TVM',
  //     'description': 'Interior wall double-coat primer and emulsion finish completed...',
  //     'status': 'Completed',
  //   },
  // ];



  // List<Map<String, String>> get _filteredTasks {
  //   final currentStatus = _tabs[_selectedTab];
  //   return _allTasks.where((task) => task['status'] == currentStatus).toList();
  // }

  void _onBottomNavTapped(int index) {
    if (index == _currentIndex) return;

    if (index == 0) {
      Navigator.popUntil(context, (route) => route.isFirst);
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }
  }

  int _selectedTabIndex = 0;



  
    @override


    void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final workerId = Provider.of<WorkerProfileProvider>(context, listen: false).profile?.workerId ?? "";
      
      // Fetch data for all three categories
      Provider.of<AcceptedTaskProvider>(context, listen: false).fetchAcceptedTasks(workerId);
      Provider.of<InProgressTaskProvider>(context, listen: false).fetchInProgressTasks(workerId);
      Provider.of<CompleteTaskProvider>(context, listen: false).fetchCompletedTasks(workerId);
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Tasks",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              children: [
                    Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTabItem(0, "Accepted Task"),
                _buildTabItem(1, "In Progress"),
                _buildTabItem(2, "Completed"),
              ],
            ),
          ),

                // Tabs Row
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                //   child: Row(
                //     children: List.generate(_tabs.length, (index) {
                //       final isSelected = _selectedTab == index;
                //       return Expanded(
                //         child: Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 4),
                //           child: GestureDetector(
                //             onTap: () {
                //               setState(() {
                //                 _selectedTab = index;
                //               });
                //             },
                //             child: Container(
                //               padding: const EdgeInsets.symmetric(vertical: 10),
                //               decoration: BoxDecoration(
                //                 color: isSelected ? const Color(0xFFFFF7F2) : Colors.transparent,
                //                 border: isSelected
                //                     ? Border.all(color: const Color(0xFFFFE5D8), width: 1)
                //                     : null,
                //                 borderRadius: BorderRadius.circular(20),
                //               ),
                //               child: Center(
                //                 child: Text(
                //                   _tabs[index],
                //                   style: TextStyle(
                //                     fontSize: 12,
                //                     fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                //                     color: isSelected ? const Color(0xFFD32F2F) : Colors.grey.shade600,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     }),
                //   ),
                // ),
                const SizedBox(height: 10),

                // Task Cards List


                //make a widget over here and call it 
                 Expanded(
                  child:_buildTaskListByTab(),





                //   child: _filteredTasks.isEmpty
                //       ? Center(
                //           child: Text(
                //             "No tasks in ${_tabs[_selectedTab]}",
                //             style: const TextStyle(color: Colors.grey, fontSize: 14),
                //           ),
                //         )
                //       : ListView.builder(
                //           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                //           itemCount: _filteredTasks.length,
                //           itemBuilder: (context, index) {
                //             final task = _filteredTasks[index];
                //             return Container(
                //               margin: const EdgeInsets.only(bottom: 16),
                //               padding: const EdgeInsets.all(16),
                //               decoration: BoxDecoration(
                //                 color: const Color(0xFFFFF7F2),
                //                 borderRadius: BorderRadius.circular(12),
                //                 border: Border.all(color: const Color(0xFFFFE5D8), width: 1),
                //               ),
                //               child: Material(
                //                 color: Colors.transparent,
                //                 child: InkWell(
                //                   borderRadius: BorderRadius.circular(12),
                //                     onTap: () {
                //                         Navigator.push(
                //                           context,
                //                           MaterialPageRoute(
                //                             builder: (context) => const CustomerTask(),
                //                           ),
                //                         );
                //                     },
                //                   child: Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                       Row(
                //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                         children: [
                //                           Text(
                //                             task['title']!,
                //                             style: const TextStyle(
                //                               fontSize: 15,
                //                               fontWeight: FontWeight.bold,
                //                               color: Colors.black87,
                //                             ),
                //                           ),
                //                           Text(
                //                             task['price']!,
                //                             style: TextStyle(
                //                               fontSize: 13,
                //                               fontWeight: FontWeight.bold,
                //                               color: Colors.grey.shade700,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                       const SizedBox(height: 6),
                //                       Row(
                //                         children: [
                //                           Icon(
                //                             Icons.location_on_outlined,
                //                             size: 14,
                //                             color: Colors.grey.shade600,
                //                           ),
                //                           const SizedBox(width: 4),
                //                           Text(
                //                             task['location']!,
                //                             style: TextStyle(
                //                               fontSize: 12,
                //                               color: Colors.grey.shade600,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                       const SizedBox(height: 12),
                //                       Row(
                //                         crossAxisAlignment: CrossAxisAlignment.end,
                //                         children: [
                //                           Expanded(
                //                             child: Text(
                //                               task['description']!,
                //                               style: TextStyle(
                //                                 fontSize: 12,
                //                                 color: Colors.grey.shade700,
                //                                 height: 1.3,
                //                               ),
                //                               maxLines: 2,
                //                               overflow: TextOverflow.ellipsis,
                //                             ),
                //                           ),
                //                           const SizedBox(width: 8),
                //                           Icon(
                //                             Icons.chevron_right,
                //                             color: Colors.grey.shade500,
                //                             size: 20,
                //                           ),
                //                         ],
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             );
                //           },
                //         ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );

    
  }
      //widget for tabs
  Widget _buildTaskListByTab() {
    if (_selectedTabIndex == 0) {
      return Consumer<AcceptedTaskProvider>(
        builder: (context, provider, _) => _buildList(provider.isLoading, provider.tasks, "No accepted tasks"),
      );
    } else if (_selectedTabIndex == 1) {
      return Consumer<InProgressTaskProvider>(
        builder: (context, provider, _) => _buildList(provider.isLoading, provider.tasks, "No tasks in progress"),
      );
    } else {
      return Consumer<CompleteTaskProvider>(
        builder: (context, provider, _) => _buildList(provider.isLoading, provider.tasks, "No completed tasks"),
      );
    }
  }
    Widget _buildList(bool isLoading, List tasks, String emptyMessage) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator(color: Color(0xFFA13C2B)));
    }
    if (tasks.isEmpty) {
      return Center(child: Text(emptyMessage));
    }
    return RefreshIndicator(
     onRefresh:   () async {
 
    await Future.delayed(Duration(seconds: 1));},
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: tasks.length,
        itemBuilder: (context, index) => _buildTaskCard(tasks[index]),
      ),
    );
  }
   Widget _buildTabItem(int index, String title) {
    bool isSelected = _selectedTabIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF1F0) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? const Color(0xFFA13C2B) : Colors.grey,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  // Generic Task Card (Works with different models as long as property names match)
    Widget _buildTaskCard(dynamic task) {
    return GestureDetector(
      onTap: () {
        // Navigate based on the selected tab index
        if (_selectedTabIndex == 0) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProjectDetailsScreen(task: task)));
        } else if (_selectedTabIndex == 1) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => InprogresstaskDetailScreen(task: task)));
        } else {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => CompletedTaskDetailscreen(task: task)));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFF8F6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  task.categoryName ?? "Category",
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF535E73)),
                ),
                Text(
                  "₹${task.budget}/-",
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF535E73)),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    task.location ?? "No Location",
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: Divider(color: Color(0xFFF0F0F0), thickness: 1.5),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    task.taskDescription ?? "No description available",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Color(0xFF7D8797), fontSize: 13, height: 1.4),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFF535E73)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

