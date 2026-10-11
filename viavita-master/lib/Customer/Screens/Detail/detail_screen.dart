// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
// import 'package:via_vita_mobile_app/Providers/task_provider.dart';


// class DetailScreen extends StatefulWidget {
//   final String task; // 1. Add the task variable

//   // 2. Update constructor to require the task
//   const DetailScreen({super.key, required this.task});

//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }

// class _DetailScreenState extends State<DetailScreen> {
  
//   // Helper to convert category ID to a Name (Since API returns "1", "2" etc)


//   // Helper to map Status ID to Text
//   String getStatusText(String statusId) {
//     return statusId == '0' ? 'Pending' : 'In Progress';
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Access data using widget.task
//     //final task = widget.task;
//       final tasktData =
//         Provider.of<TaskProvider>(context).tasks.firstWhere((element) => element.taskId == widget.task);

//     return Scaffold(
//       backgroundColor: colors.background_color,
//       appBar: AppBar(
//          backgroundColor: colors.background_color,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, size: 17),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text('View Details', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
//         centerTitle: false,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // 3. Dynamic Title (Category)
//                 Text(
//                   tasktData.categoryname,
//                   style: const TextStyle(
//                     fontSize: 21,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   decoration: BoxDecoration(
//                     color: colors.task_progress_color,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   // 4. Dynamic Status
//                   child: Text(
//                     getStatusText(tasktData.status),
//                     style: TextStyle(
//                       fontSize: 11,
//                       color: colors.progress_pending_txtcolor,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
            
//             // 5. Dynamic Details
//             _buildDetailRow(
//               icon: Icons.account_balance_wallet,
//               label: 'Budget',
//               value: '₹ ${tasktData.budget}/-',
//             ),
//             _buildDetailRow(
//               icon: Icons.location_on,
//               label: 'Location',
//               value: tasktData.location,
//             ),
//             _buildDetailRow(
//               icon: Icons.calendar_today,
//               label: 'Expected Deadline',
//               value: tasktData.deadlineDate,
//             ),
            
//             // Added Customer Name to show full API usage
//             // _buildDetailRow(
//             //   icon: Icons.person,
//             //   label: 'Customer',
//             //   value: task.customerDetails?.name ?? 'Unknown',
//             // ),

//             const SizedBox(height: 30),
//             const Text(
//               'Description',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black
//               ),
//             ),
//             const SizedBox(height: 10),
//             // 6. Dynamic Description
//             Text(
//               tasktData.description,
//               style: TextStyle(
//                 fontSize: 12,
//                 height: 1.5,
//                 color: colors.task_text_color
//               ),
//             ),
//             const SizedBox(height: 40),
//             Center(
//               child: Container(
//                 width: double.infinity,
//                 height: 50,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       colors.app_color_1, colors.app_color_2
//                     ],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                   ),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TextButton(
//                   onPressed: () {
//                     // Handle Edit or Apply logic here
//                   },
//                   child: const Text(
//                     'Edit', 
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow({required IconData icon, required String label, required String value}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.grey.shade700, size: 20),
//           const SizedBox(width: 10),
//           Text(
//             '$label - ',
//             style: TextStyle(
//               fontSize: 12,
//               color: colors.task_text_color, fontWeight: FontWeight.w500
//             ),
//           ),
//           Expanded( // Added Expanded to prevent overflow if text is long
//             child: Text(
//               value,
//               style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.w500,
//                 color: colors.task_text_color
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Task/edit_task_screen.dart' show EditTaskScreen;

class TaskDetailScreen extends StatelessWidget {
  final String id;
  final String title;
  final String budget;
  final String location; // Ensure your model has this or use a placeholder
  final String deadline;
  final String description;
  final String categoryid;

  const TaskDetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.budget,
    required this.location,
    required this.deadline,
    required this.description,
    required this.categoryid
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'View Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Title and Pending Badge
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF37474F),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3E0),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Pending',
                    style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w500,fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            
            // Detail Rows
            _buildInfoRow(Icons.account_balance_wallet_outlined, 'Budget -  ${budget}'),
//_buildDetailRow(Icons.account_balance_wallet_outlined, "Budget - ", budget),
            const SizedBox(height: 15),
             _buildInfoRow(Icons.location_on_outlined, 'Location - ${location}'),
          //  _buildDetailRow(Icons.location_on_outlined, "Location - ", location),
            const SizedBox(height: 15),
             _buildInfoRow(Icons.calendar_today_outlined, 'Expected Dead line - ${deadline}'),
          //  _buildDetailRow(Icons.calendar_today_outlined, "Expected Dead line - ", deadline),
            
            const SizedBox(height: 35),
            
            // Description Section
            const Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF37474F)),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.blueGrey,
                height: 1.4,
              ),
            ),

            SizedBox(height: 30),
            
            // const Spacer(),
            
            // Edit Button
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [colors.app_color_1, colors.app_color_2], // Using your theme colors
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {
                      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditTaskScreen(
            taskData: {
              "task_id":id,
              "description": description,
              "location": location,
              "budget": budget,
              "deadline_date": deadline,
              "job_category_id":categoryid,
            },
          ),
        ),
      );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildDetailRow(IconData icon, String label, String value) {
  //   return Row(
  //     children: [
  //       Icon(icon, color: Colors.grey, size: 20),
  //       const SizedBox(width: 10),
  //       RichText(
  //         text: TextSpan(
  //           style: const TextStyle(fontSize: 14, color: Colors.grey),
  //           children: [
  //             TextSpan(text: label),
  //             TextSpan(
  //               text: value,
  //               style: const TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.w600,fontSize: 14),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }
    Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey[600]),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 13, color: Colors.blueGrey[400], fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}