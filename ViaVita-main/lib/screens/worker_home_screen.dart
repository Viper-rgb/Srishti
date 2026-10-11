import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workers_app/Appimage.dart';
import 'package:workers_app/colors/colors.dart';
import 'package:workers_app/provider/task_provider.dart';
import 'package:workers_app/provider/worker_profile_provider.dart';
import 'package:workers_app/provider/worker_task_count_provider.dart';
import 'package:workers_app/screens/Inprogress.dart';
import 'package:workers_app/screens/subscription_plans_screen.dart';
import 'package:workers_app/screens/worker-shop.dart';
import 'package:workers_app/screens/worker_my_task_screen.dart';
import 'package:workers_app/widget/count_container_widget.dart';
import 'package:workers_app/widget/home_app_bar_widget.dart';
import 'package:workers_app/widget/menu_container_widget.dart';

class WorkerHomeScreen extends StatefulWidget {
  const WorkerHomeScreen({super.key});

  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadProfileData();
      Provider.of<TaskProvider>(context, listen: false).fetchNewTasks();
    });
  }

  void loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final workerId = prefs.getString("id");

    if (workerId != null && mounted) {
      Provider.of<WorkerProfileProvider>(context, listen: false)
          .fetchWorkerProfile(workerId);

      Provider.of<WorkerTaskCountProvider>(context, listen: false)
          .fetchTaskCount(workerId);
    } else {
      print("Error: Worker ID not found in SharedPreferences");
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<WorkerProfileProvider>(context);
    final taskProvider = Provider.of<WorkerTaskCountProvider>(context);
    final mediaquery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: colors.background_color,
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 50.0),
        child: Column(
          children: [
            HomeAppBarWidget(
                name: profile.profile?.name ?? "",
                imgUrl: profile.profile?.avatar ?? ""),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: mediaquery.height * 0.03),
                    SizedBox(height: mediaquery.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CountContainerWidgets(
                          bgColor: colors.worker_card1_color,
                          text: 'New Task',
                          count: taskProvider.taskData?['new_tasks']
                                  ?.toString() ??
                              '0',
                        ),
                        CountContainerWidgets(
                          bgColor: colors.worker_card2_color,
                          text: 'Accepted',
                          count: taskProvider.taskData?['accepted_tasks']
                                  ?.toString() ??
                              '0',
                        ),
                      ],
                    ),
                    SizedBox(height: mediaquery.height * 0.03),
                    Column(
                      children: [
                        MenuContainerWidgets(
                          icondata: Appicons.viewall_task_icon,
                          title: 'View all Tasks',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        WorkerMyTaskScreen()));
                          },
                        ),
                        SizedBox(height: mediaquery.height * 0.008),
                        MenuContainerWidgets(
                          icondata: Appicons.manage_sub_icon,
                          title: 'Manage Subscription',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SubscriptionPlansScreen()));
                          },
                        ),
                        SizedBox(height: mediaquery.height * 0.008),
                        MenuContainerWidgets(
                          icondata: Appicons.visit_shop_icon,
                          title: 'Visit Shop',
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyWidget()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: mediaquery.height * 0.02),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
