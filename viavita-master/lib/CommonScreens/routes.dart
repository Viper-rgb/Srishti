import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:via_vita_mobile_app/Providers/accepted_task_provider.dart';
import 'package:via_vita_mobile_app/Providers/add_estimate_shop_provider.dart';
import 'package:via_vita_mobile_app/Providers/add_requirement_provider.dart';
import 'package:via_vita_mobile_app/Providers/add_task_provider.dart';
import 'package:via_vita_mobile_app/Providers/booking_provider.dart';
import 'package:via_vita_mobile_app/Providers/complete_task_provider.dart';
import 'package:via_vita_mobile_app/Providers/confirm_estimate_provider.dart';
import 'package:via_vita_mobile_app/Providers/cutomer_viewall_taskprovider.dart';
import 'package:via_vita_mobile_app/Providers/edit_profile_provider.dart';
import 'package:via_vita_mobile_app/Providers/edit_task_provider.dart';
import 'package:via_vita_mobile_app/Providers/forget_password_provider.dart';
import 'package:via_vita_mobile_app/Providers/in_progress_task_provider.dart';
import 'package:via_vita_mobile_app/Providers/login_provider.dart';
import 'package:via_vita_mobile_app/Providers/profile_provider.dart';
import 'package:via_vita_mobile_app/Providers/register_provider.dart';
import 'package:via_vita_mobile_app/Providers/review_provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_all_requirements_provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_edit_profile_provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_login_provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_profile_provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_register_provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_requirementcount_provider.dart';
import 'package:via_vita_mobile_app/Providers/subscription_provider.dart';
import 'package:via_vita_mobile_app/Providers/task_provider.dart';
import 'package:via_vita_mobile_app/Providers/task_status_change_provider.dart';

import 'package:via_vita_mobile_app/Providers/task_status_provider.dart';
import 'package:via_vita_mobile_app/Providers/view_estimate_provider.dart';
import 'package:via_vita_mobile_app/Providers/view_rating_provider.dart';
import 'package:via_vita_mobile_app/Providers/worker_edit_profile_provider.dart';
import 'package:via_vita_mobile_app/Providers/worker_login_provider.dart';
import 'package:via_vita_mobile_app/Providers/worker_profile_provider.dart';
import 'package:via_vita_mobile_app/Providers/worker_register_provider.dart';
import 'package:via_vita_mobile_app/Providers/worker_task_count_provider.dart';

List<SingleChildWidget> multiprovider = [
  ChangeNotifierProvider(create: (context) => LoginProvider()),
  ChangeNotifierProvider(create: (context) => ProfileProvider()),
  ChangeNotifierProvider(create: (context) => RegisterProvider()),
  ChangeNotifierProvider(create: (context) => WorkerLoginProvider()),
  ChangeNotifierProvider(create: (context) => WorkerRegisterProvider()),
  ChangeNotifierProvider(create: (context) => ShopLoginProvider()),
  ChangeNotifierProvider(create: (context) => ShopRegisterProvider()),
  ChangeNotifierProvider(create: (context) => TaskProvider()),
  ChangeNotifierProvider(create: (context) => TaskStatusProvider()),
  ChangeNotifierProvider(create: (context) => EditProfileProvider()),
  ChangeNotifierProvider(create: (context) => WorkerProfileProvider()),
  ChangeNotifierProvider(create: (context) => WorkerEditProfileProvider()),
  ChangeNotifierProvider(create: (context) => ShopProfileProvider()),
  ChangeNotifierProvider(create: (context) => ShopEditProfileProvider()),
  ChangeNotifierProvider(create: (context) => ForgotPasswordProvider()),
  ChangeNotifierProvider(create: (context) => CutomerViewallTaskprovider()),
  ChangeNotifierProvider(create: (context) => ShopAllRequirementsProvider()),
  ChangeNotifierProvider(create: (context) => AddRequirementProvider()),
  ChangeNotifierProvider(create: (context) => AcceptedTaskProvider()),
  ChangeNotifierProvider(create: (context) => InProgressTaskProvider()),
  ChangeNotifierProvider(create: (context) => CompleteTaskProvider()),
  ChangeNotifierProvider(create: (context) => AddEstimateShopProvider()),
  ChangeNotifierProvider(create: (context) => ViewEstimateProvider()),
  ChangeNotifierProvider(create: (context)=>AddTaskProvider()),
  ChangeNotifierProvider(create: (context)=>TaskActionProvider()),
  ChangeNotifierProvider(create: (context)=>WorkerTaskCountProvider()),
  ChangeNotifierProvider(create: (context)=>ShopProvider()),
  ChangeNotifierProvider(create: (context)=>EditTaskProvider()),
  ChangeNotifierProvider(create: (context)=>ReviewProvider()),
  ChangeNotifierProvider(create: (context)=>ShopRequirementcountProvider()),
  ChangeNotifierProvider(create: (context)=>BookingProvider(),),
  ChangeNotifierProvider(create: (context)=>ConfirmEstimateProvider()),
  ChangeNotifierProvider(create: (context)=>SubscriptionProvider()),
  ChangeNotifierProvider(create: (context)=>ViewRatingProvider())
];
