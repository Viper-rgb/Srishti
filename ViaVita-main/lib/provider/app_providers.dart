import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:workers_app/detail/in_progress_task_provider.dart';
import 'package:workers_app/provider/AcceptedTaskProvider.dart';
import 'package:workers_app/provider/add_requirement_provider.dart';
import 'package:workers_app/provider/complete_task_provider.dart';
import 'package:workers_app/provider/taskAction_provider.dart';
import 'package:workers_app/provider/task_provider.dart';
import 'package:workers_app/provider/worker_profile_provider.dart';
import 'package:workers_app/provider/worker_task_count_provider.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context) => TaskProvider()),
  ChangeNotifierProvider(create: (context) => WorkerProfileProvider()),
  ChangeNotifierProvider(create: (context) => AddRequirementProvider()),
  ChangeNotifierProvider(create: (context) => AcceptedTaskProvider()),
  ChangeNotifierProvider(create: (context) => InProgressTaskProvider()),
  ChangeNotifierProvider(create: (context) => CompleteTaskProvider()),
  ChangeNotifierProvider(create: (context) => TaskActionProvider()),
  ChangeNotifierProvider(create: (context) => WorkerTaskCountProvider()),
];
