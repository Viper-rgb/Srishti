// import 'package:flutter/material.dart';



// class ProjectDetailsScreen extends StatefulWidget {
//   const ProjectDetailsScreen({super.key});

//   @override
//   State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
// }

// class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
//           onPressed: () {},
//         ),
//         title: const Text(
//           "View Details",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header Section: Name and Category Tag
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   "Suresh Kumar",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.w600,
//                     color: Color(0xFF455A64),
//                   ),
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFFFEBEE),
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   child: const Text(
//                     "Painting",
//                     style: TextStyle(color: Color(0xFFC62828), fontWeight: FontWeight.w500, fontSize: 12),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 25),

//             // Info Rows
//             _buildInfoRow(Icons.account_balance_wallet_outlined, "Budget - ₹ 15,000/-"),
//             const SizedBox(height: 12),
//             _buildInfoRow(Icons.location_on_outlined, "Location - Coimbatore"),
//             const SizedBox(height: 12),
//             _buildInfoRow(Icons.calendar_today_outlined, "Expected Dead line - 20 September, 2025"),
            
//             const SizedBox(height: 30),

//             // Status Stepper Section
//             _buildStatusItem("Started", true, isLast: false),
//             _buildStatusItem("In Progress", true, isLast: false),
//             _buildStatusItem("Completed", false, isLast: true),

//             const SizedBox(height: 30),

//             // Description Section
//             const Text(
//               "Description",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF37474F)),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               "We need a skilled carpenter to build and install a custom wooden wardrobe and kitchen shelves. The work includes precise measurements, cutting, assembling, and polishing. All materials will be provided, but high-quality craftsmanship is expected. The job should be completed within 5 days with a neat finish.",
//               style: TextStyle(fontSize: 13, color: Colors.blueGrey[600], height: 1.4),
//             ),

//             const SizedBox(height: 25),

//             // Requirements Section
//             const Text(
//               "Requirements",
//               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF37474F)),
//             ),
//             const SizedBox(height: 8),
//             Text(
//               "We need a skilled carpenter to build and install a custom wooden wardrobe and kitchen shelves. The work includes precise measurements, cutting, assembling, and polishing.",
//               style: TextStyle(fontSize: 13, color: Colors.blueGrey[600], height: 1.4),
//             ),
//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//     );
//   }

//   // Helper widget for Icon + Text rows
//   Widget _buildInfoRow(IconData icon, String text) {
//     return Row(
//       children: [
//         Icon(icon, size: 20, color: Colors.grey[600]),
//         const SizedBox(width: 10),
//         Text(
//           text,
//           style: TextStyle(fontSize: 13, color: Colors.blueGrey[400], fontWeight: FontWeight.w500),
//         ),
//       ],
//     );
//   }

//   // Helper widget for the custom Vertical Stepper
//   Widget _buildStatusItem(String label, bool isDone, {required bool isLast}) {
//     return IntrinsicHeight(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Column(
//             children: [
//               Container(
//                 width: 24,
//                 height: 24,
//                 decoration: BoxDecoration(
//                   color: isDone ? const Color(0xFFF15A24) : Colors.grey[300],
//                   shape: BoxShape.circle,
//                 ),
//                 child: isDone 
//                   ? const Icon(Icons.check, color: Colors.white, size: 16) 
//                   : null,
//               ),
//               if (!isLast)
//                 Expanded(
//                   child: Container(
//                     width: 2,
//                     color: Colors.grey[300],
//                   ),
//                 ),
//             ],
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (label == "Completed")
//                   Padding(
//                     padding: const EdgeInsets.only(bottom: 12),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFF15A24),
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       child: const Text(
//                         "Completed",
//                         style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 13),
//                       ),
//                     ),
//                   )
//                 else
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 2),
//                     child: Text(
//                       label,
//                       style: TextStyle(
//                         fontSize: 13, 
//                         color: isDone ? const Color(0xFF78909C) : Colors.grey,
//                         fontWeight: FontWeight.w500
//                       ),
//                     ),
//                   ),
//                 if (!isLast) const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }