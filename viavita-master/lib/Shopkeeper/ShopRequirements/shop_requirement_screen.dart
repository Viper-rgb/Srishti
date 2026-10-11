// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
// // import 'package:via_vita_mobile_app/DataModels/all_requiremts_shop_model.dart';
// // import 'package:via_vita_mobile_app/Providers/add_estimate_shop_provider.dart';
// // import 'package:via_vita_mobile_app/Providers/shop_all_requirements_provider.dart';
// // import 'package:via_vita_mobile_app/Providers/shop_profile_provider.dart';




// // class AllRequirementsScreen extends StatefulWidget {
// //   const AllRequirementsScreen({super.key});

// //   @override
// //   State<AllRequirementsScreen> createState() => _AllRequirementsScreenState();
// // }

// // class _AllRequirementsScreenState extends State<AllRequirementsScreen> {
// //   int _selectedTab = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       context.read<ShopAllRequirementsProvider>().fetchTasks();
// //     });
// //   }
  

// //   @override
// //   Widget build(BuildContext context) {
// //     final taskProvider = context.watch<ShopAllRequirementsProvider>();
// //     final filteredTasks = taskProvider.getFilteredTasks(_selectedTab);

// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         leading: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
// //         title: const Text(
// //           "All Requirements",
// //           style: TextStyle(color: Color(0xFF333333), fontWeight: FontWeight.w500, fontSize: 16),
// //         ),
// //       ),
// //       body: Column(
// //         children: [
// //           const SizedBox(height: 10),
// //           // --- Tab Bar ---
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
// //             child: Row(
// //               children: [
// //                 Expanded(child: CustomTab(text: "New Requirements", isSelected: _selectedTab == 0, onTap: () => setState(() => _selectedTab = 0))),
// //                 const SizedBox(width: 5),
// //                 Expanded(child: CustomTab(text: "Accepted", isSelected: _selectedTab == 1, onTap: () => setState(() => _selectedTab = 1))),
// //                 const SizedBox(width: 5),
              
// //               ],
// //             ),
// //           ),
          
// //           // --- Search Bar ---
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: const Color(0xFFF8F8F8),
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child: const TextField(
// //                 decoration: InputDecoration(
// //                   hintText: "Search here...",
// //                   hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
// //                   prefixIcon: Icon(Icons.search, color: Colors.grey),
// //                   suffixIcon: Icon(Icons.tune, color: Colors.grey),
// //                   border: InputBorder.none,
// //                   contentPadding: EdgeInsets.symmetric(vertical: 15),
// //                 ),
// //               ),
// //             ),
// //           ),

// //           // --- Task List ---
// //           Expanded(
// //             child: taskProvider.isLoading 
// //               ? const Center(child: CircularProgressIndicator(color: Color(0xFFC63D18)))
// //               : ListView.builder(
// //                   padding: const EdgeInsets.symmetric(horizontal: 16),
// //                   itemCount: filteredTasks.length,
// //                   itemBuilder: (context, index) {
// //                     return RequirementCard(task: filteredTasks[index]);
// //                   },
// //                 ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class CustomTab extends StatelessWidget {
// //   final String text;
// //   final bool isSelected;
// //   final VoidCallback onTap;

// //   const CustomTab({super.key, required this.text, required this.isSelected, required this.onTap});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(vertical: 12),
// //         decoration: BoxDecoration(
// //           color: isSelected ? const Color(0xFFFFF0ED) : Colors.transparent,
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //         child: Text(
// //           text,
// //           textAlign: TextAlign.center,
// //           style: TextStyle(
// //             color: isSelected ? const Color(0xFFC63D18) : Colors.grey,
// //             fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
// //             fontSize: 12,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class RequirementCard extends StatelessWidget {
// //   final AllRequiremtsShopModel task;
// //   const RequirementCard({super.key, required this.task});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 16),
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: colors.container_color,
// //         borderRadius: BorderRadius.circular(15),
// //         border: Border.all(color: const Color(0xFFF5F5F5)),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             task.categoryName,
// //             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF4A5660)),
// //           ),
// //           const SizedBox(height: 6),
// //           Row(
// //             children: [
// //               const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
// //               const SizedBox(width: 4),
// //               Text(
// //                 "Location - ${task.location}",
// //                 style: const TextStyle(color: Colors.grey, fontSize: 13),
// //               ),
// //             ],
// //           ),
// //           const Padding(
// //             padding: EdgeInsets.symmetric(vertical: 12.0),
// //             child: Divider(color: Color(0xFFEEEEEE), thickness: 1),
// //           ),
// //           Text(
// //             task.taskDescription,
// //             style: const TextStyle(color: Color(0xFF7D848D), fontSize: 13, height: 1.5),
// //           ),
// //           const SizedBox(height: 20),
// //           Row(
// //             children: [
// //               Expanded(
// //                 child: OutlinedButton(
// //                   onPressed: () {},
// //                   style: OutlinedButton.styleFrom(
// //                     side: const BorderSide(color: Color(0xFFC63D18)),
// //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //                     padding: const EdgeInsets.symmetric(vertical: 15),
// //                   ),
// //                   child: const Text("Remove", style: TextStyle(color: Color(0xFFC63D18), fontWeight: FontWeight.w500)),
// //                 ),
// //               ),
// //              SizedBox(width: 15),
// //               Expanded(
// //                 child: ElevatedButton(
// //                   onPressed: () {
// //                    showEstimateDialog(context, task.taskId);
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: const Color(0xFFC63D18),
// //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //                     padding: const EdgeInsets.symmetric(vertical: 15),
// //                     elevation: 0,
// //                   ),
// //                   child: const Text("Add Estimate", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
// //                 ),
// //               ),
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
// // void showEstimateDialog(BuildContext context, String taskId) {
// //   final TextEditingController descriptionController = TextEditingController();
// //   final TextEditingController priceController = TextEditingController();

// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       // Use Consumer to listen to loading state
// //       return Consumer<AddEstimateShopProvider>(
// //         builder: (context, provider, child) {
// //           return AlertDialog(
// //             backgroundColor: Colors.white,
// //             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// //             title: const Text(
// //               "Estimate",
// //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF333333)),
// //             ),
// //             content: SingleChildScrollView(
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const Text("Description", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
// //                   const SizedBox(height: 8),
// //                   TextField(
// //                     controller: descriptionController,
// //                     maxLines: 4,
// //                     decoration: InputDecoration(
// //                       hintText: "Enter description...",
// //                       filled: true,
// //                       fillColor: Colors.grey[50],
// //                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 20),
// //                   const Text("Price", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
// //                   const SizedBox(height: 8),
// //                   TextField(
// //                     controller: priceController,
// //                     keyboardType: TextInputType.number,
// //                     decoration: InputDecoration(
// //                       hintText: "₹0/-",
// //                       filled: true,
// //                       fillColor: Colors.grey[50],
// //                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 24),
// //                   Row(
// //                     children: [
// //                       Expanded(
// //                         child: OutlinedButton(
// //                           onPressed: () => Navigator.pop(context),
// //                           style: OutlinedButton.styleFrom(
// //                             padding: const EdgeInsets.symmetric(vertical: 16),
// //                             side: const BorderSide(color: Color(0xFF9E3127)),
// //                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                           ),
// //                           child: const Text("Cancel", style: TextStyle(color: Color(0xFF9E3127), fontSize: 16)),
// //                         ),
// //                       ),
// //                       const SizedBox(width: 12),
// //                       Expanded(
// //                         child: Container(
// //                           decoration: BoxDecoration(
// //                             gradient: const LinearGradient(
// //                               colors: [Color(0xFF9E2114), Color(0xFFE85D22)],
// //                               begin: Alignment.centerLeft,
// //                               end: Alignment.centerRight,
// //                             ),
// //                             borderRadius: BorderRadius.circular(12),
// //                           ),
// //                           child: ElevatedButton(
// //                             onPressed: provider.isLoading
// //                                 ? null
// //                                 : () async {
// //                                     if (descriptionController.text.isEmpty || priceController.text.isEmpty) {
// //                                       // Simple validation
// //                                       ScaffoldMessenger.of(context).showSnackBar(
// //                                         const SnackBar(content: Text("Please fill all fields")),
// //                                       );
// //                                       return;
// //                                     }

// //                                     // Replace '1' with your actual logged-in shopkeeper ID
// //                                     final shopkeeperId = Provider.of<ShopProfileProvider>(context, listen: false);

// //                                     await provider.addEstimate(
// //                                       taskId,
// //                                       shopkeeperId.profile?.shopkeeperId ?? "",
// //                                       descriptionController.text,
// //                                       priceController.text,
// //                                       context,
// //                                     );

// //                                     // Close dialog after success
// //                                     if (!provider.isLoading && provider.errorMessage == null) {
// //                                       Navigator.pop(context);
// //                                     }
// //                                   },
// //                             style: ElevatedButton.styleFrom(
// //                               backgroundColor: Colors.transparent,
// //                               shadowColor: Colors.transparent,
// //                               padding: const EdgeInsets.symmetric(vertical: 16),
// //                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //                             ),
// //                             child: provider.isLoading
// //                                 ? const SizedBox(
// //                                     height: 20,
// //                                     width: 20,
// //                                     child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
// //                                   )
// //                                 : const Text("Send", style: TextStyle(color: Colors.white, fontSize: 16)),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       );
// //     },
// //   );
// // }
// // // void showEstimateDialog(BuildContext context) {
// // //   showDialog(
// // //     context: context,
// // //     builder: (BuildContext context) {
// // //       return AlertDialog(
// // //         backgroundColor: Colors.white,
// // //         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
// // //         title: const Text(
// // //           "Estimate",
// // //           style: TextStyle(
// // //             fontWeight: FontWeight.bold,
// // //             fontSize: 22,
// // //             color: Color(0xFF333333),
// // //           ),
// // //         ),
// // //         content: SingleChildScrollView(
// // //           child: Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               // Description Section
// // //               const Text(
// // //                 "Description",
// // //                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
// // //               ),
// // //               const SizedBox(height: 8),
// // //               TextField(
// // //                 maxLines: 4,
// // //                 decoration: InputDecoration(
// // //                   hintText: "Description",
// // //                   filled: true,
// // //                   fillColor: Colors.grey[50],
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(12),
// // //                     borderSide: BorderSide.none,
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 20),

// // //               // Price Section
// // //               const Text(
// // //                 "Price",
// // //                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
// // //               ),
// // //               const SizedBox(height: 8),
// // //               TextField(
// // //                 keyboardType: TextInputType.number,
// // //                 decoration: InputDecoration(
// // //                   hintText: "₹0/-",
// // //                   filled: true,
// // //                   fillColor: Colors.grey[50],
// // //                   border: OutlineInputBorder(
// // //                     borderRadius: BorderRadius.circular(12),
// // //                     borderSide: BorderSide.none,
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 24),

// // //               // Buttons Section
// // //               Row(
// // //                 children: [
// // //                   // Cancel Button
// // //                   Expanded(
// // //                     child: OutlinedButton(
// // //                       onPressed: () => Navigator.pop(context),
// // //                       style: OutlinedButton.styleFrom(
// // //                         padding: const EdgeInsets.symmetric(vertical: 16),
// // //                         side: const BorderSide(color: Color(0xFF9E3127)),
// // //                         shape: RoundedRectangleBorder(
// // //                           borderRadius: BorderRadius.circular(12),
// // //                         ),
// // //                       ),
// // //                       child: const Text(
// // //                         "Cancel",
// // //                         style: TextStyle(color: Color(0xFF9E3127), fontSize: 16),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                   const SizedBox(width: 12),
// // //                   // Send Button with Gradient
// // //                   Expanded(
// // //                     child: Container(
// // //                       decoration: BoxDecoration(
// // //                         gradient: const LinearGradient(
// // //                           colors: [Color(0xFF9E2114), Color(0xFFE85D22)],
// // //                           begin: Alignment.centerLeft,
// // //                           end: Alignment.centerRight,
// // //                         ),
// // //                         borderRadius: BorderRadius.circular(12),
// // //                       ),
// // //                       child: ElevatedButton(
// // //                         onPressed: () {
// // //                           // Add your logic here
// // //                         },
// // //                         style: ElevatedButton.styleFrom(
// // //                           backgroundColor: Colors.transparent,
// // //                           shadowColor: Colors.transparent,
// // //                           padding: const EdgeInsets.symmetric(vertical: 16),
// // //                           shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(12),
// // //                           ),
// // //                         ),
// // //                         child: const Text(
// // //                           "Send",
// // //                           style: TextStyle(color: Colors.white, fontSize: 16),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       );
// // //     },
// // //   );
// // // }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
// import 'package:via_vita_mobile_app/DataModels/all_requiremts_shop_model.dart';
// import 'package:via_vita_mobile_app/Providers/add_estimate_shop_provider.dart';
// import 'package:via_vita_mobile_app/Providers/shop_all_requirements_provider.dart';
// import 'package:via_vita_mobile_app/Providers/shop_profile_provider.dart';
// import 'package:via_vita_mobile_app/ShopKeeper/ShopRequirements/Estimate/view_estimate_screen.dart';

// // Import your EstimateListScreen here if it's in another file
// // import 'package:via_vita_mobile_app/Screens/estimate_list_screen.dart';

// class AllRequirementsScreen extends StatefulWidget {
//   const AllRequirementsScreen({super.key});

//   @override
//   State<AllRequirementsScreen> createState() => _AllRequirementsScreenState();
// }

// class _AllRequirementsScreenState extends State<AllRequirementsScreen> {
//   int _selectedTab = 0; // 0 for New Requirements, 1 for Accepted

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<ShopAllRequirementsProvider>().fetchTasks();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final taskProvider = context.watch<ShopAllRequirementsProvider>();
//     final filteredTasks = taskProvider.getFilteredTasks(_selectedTab);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text(
//           "All Requirements",
//           style: TextStyle(color: Color(0xFF333333), fontWeight: FontWeight.w500, fontSize: 16),
//         ),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 10),
//           // --- Tab Bar ---
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: CustomTab(
//                     text: "New Requirements",
//                     isSelected: _selectedTab == 0,
//                     onTap: () => setState(() => _selectedTab = 0),
//                   ),
//                 ),
//                 const SizedBox(width: 5),
//                 Expanded(
//                   child: CustomTab(
//                     text: "Accepted",
//                     isSelected: _selectedTab == 1,
//                     onTap: () => setState(() => _selectedTab = 1),
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // --- Search Bar (Visible for New Requirements) ---
//           if (_selectedTab == 0)
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF8F8F8),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const TextField(
//                   decoration: InputDecoration(
//                     hintText: "Search here...",
//                     hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
//                     prefixIcon: Icon(Icons.search, color: Colors.grey),
//                     suffixIcon: Icon(Icons.tune, color: Colors.grey),
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.symmetric(vertical: 15),
//                   ),
//                 ),
//               ),
//             ),

//           // --- Dynamic Content Area ---
//           Expanded(
//             child: _selectedTab == 0
//                 ? _buildNewRequirementsView(taskProvider, filteredTasks)
//                 :  EstimateListScreen(), // Shows the screen when Tab 1 is active
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget for Tab 0 Content
//   Widget _buildNewRequirementsView(ShopAllRequirementsProvider taskProvider, List<AllRequiremtsShopModel> filteredTasks) {
//     if (taskProvider.isLoading) {
//       return const Center(child: CircularProgressIndicator(color: Color(0xFFC63D18)));
//     }
    
//     if (filteredTasks.isEmpty) {
//       return const Center(child: Text("No new requirements found."));
//     }

//     return ListView.builder(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       itemCount: filteredTasks.length,
//       itemBuilder: (context, index) {
//         return RequirementCard(task: filteredTasks[index]);
//       },
//     );
//   }
// }

// // --- TAB WIDGET ---
// class CustomTab extends StatelessWidget {
//   final String text;
//   final bool isSelected;
//   final VoidCallback onTap;

//   const CustomTab({super.key, required this.text, required this.isSelected, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFFFFF0ED) : Colors.transparent,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Text(
//           text,
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: isSelected ? const Color(0xFFC63D18) : Colors.grey,
//             fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
//             fontSize: 12,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // --- REQUIREMENT CARD ---
// class RequirementCard extends StatelessWidget {
//   final AllRequiremtsShopModel task;
//   const RequirementCard({super.key, required this.task});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: colors.container_color,
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: const Color(0xFFF5F5F5)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             task.categoryName,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF4A5660)),
//           ),
//           const SizedBox(height: 6),
//           Row(
//             children: [
//               const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
//               const SizedBox(width: 4),
//               Text(
//                 "Location - ${task.location}",
//                 style: const TextStyle(color: Colors.grey, fontSize: 13),
//               ),
//             ],
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 12.0),
//             child: Divider(color: Color(0xFFEEEEEE), thickness: 1),
//           ),
//           Text(
//             task.taskDescription,
//             style: const TextStyle(color: Color(0xFF7D848D), fontSize: 13, height: 1.5),
//           ),
//           const SizedBox(height: 20),
//           Row(
//             children: [
//               Expanded(
//                 child: OutlinedButton(
//                   onPressed: () {},
//                   style: OutlinedButton.styleFrom(
//                     side: const BorderSide(color: Color(0xFFC63D18)),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                   ),
//                   child: const Text("Remove", style: TextStyle(color: Color(0xFFC63D18), fontWeight: FontWeight.w500)),
//                 ),
//               ),
//               const SizedBox(width: 15),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     showEstimateDialog(context, task.taskId);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFFC63D18),
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     elevation: 0,
//                   ),
//                   child: const Text("Add Estimate", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// // --- ESTIMATE DIALOG ---
// void showEstimateDialog(BuildContext context, String taskId) {
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return Consumer<AddEstimateShopProvider>(
//         builder: (context, provider, child) {
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//             title: const Text(
//               "Estimate",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF333333)),
//             ),
//             content: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text("Description", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
//                   const SizedBox(height: 8),
//                   TextField(
//                     controller: descriptionController,
//                     maxLines: 4,
//                     decoration: InputDecoration(
//                       hintText: "Enter description...",
//                       filled: true,
//                       fillColor: Colors.grey[50],
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text("Price", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
//                   const SizedBox(height: 8),
//                   TextField(
//                     controller: priceController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       hintText: "₹0/-",
//                       filled: true,
//                       fillColor: Colors.grey[50],
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: () => Navigator.pop(context),
//                           style: OutlinedButton.styleFrom(
//                             padding: const EdgeInsets.symmetric(vertical: 16),
//                             side: const BorderSide(color: Color(0xFF9E3127)),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                           ),
//                           child: const Text("Cancel", style: TextStyle(color: Color(0xFF9E3127), fontSize: 16)),
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             gradient: const LinearGradient(
//                               colors: [Color(0xFF9E2114), Color(0xFFE85D22)],
//                               begin: Alignment.centerLeft,
//                               end: Alignment.centerRight,
//                             ),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: ElevatedButton(
//                             onPressed: provider.isLoading
//                                 ? null
//                                 : () async {
//                                     if (descriptionController.text.isEmpty || priceController.text.isEmpty) {
//                                       ScaffoldMessenger.of(context).showSnackBar(
//                                         const SnackBar(content: Text("Please fill all fields")),
//                                       );
//                                       return;
//                                     }

//                                     final shopProfile = Provider.of<ShopProfileProvider>(context, listen: false);

//                                     await provider.addEstimate(
//                                       taskId,
//                                       shopProfile.profile?.shopkeeperId ?? "",
//                                       descriptionController.text,
//                                       priceController.text,
//                                       context,
//                                     );

//                                     if (!provider.isLoading && provider.errorMessage == null) {
//                                       Navigator.pop(context);
//                                     }
//                                   },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.transparent,
//                               shadowColor: Colors.transparent,
//                               padding: const EdgeInsets.symmetric(vertical: 16),
//                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                             ),
//                             child: provider.isLoading
//                                 ? const SizedBox(
//                                     height: 20,
//                                     width: 20,
//                                     child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
//                                   )
//                                 : const Text("Send", style: TextStyle(color: Colors.white, fontSize: 16)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/DataModels/all_requiremts_shop_model.dart';
import 'package:via_vita_mobile_app/Providers/add_estimate_shop_provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_all_requirements_provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_profile_provider.dart';
import 'package:via_vita_mobile_app/ShopKeeper/ShopRequirements/Estimate/view_estimate_screen.dart';

// Ensure this import is correct based on your file structure
// import 'package:via_vita_mobile_app/ShopKeeper/ShopRequirements/Estimate/estimate_list_screen.dart';

class AllRequirementsScreen extends StatefulWidget {
  const AllRequirementsScreen({super.key});

  @override
  State<AllRequirementsScreen> createState() => _AllRequirementsScreenState();
}

class _AllRequirementsScreenState extends State<AllRequirementsScreen> {
  int _selectedTab = 0; // 0 for New Requirements, 1 for Accepted
  
  // --- Search Implementation ---
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ShopAllRequirementsProvider>().fetchTasks();
    });
  }

  @override
  void dispose() {
    _searchController.dispose(); // Clean up the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = context.watch<ShopAllRequirementsProvider>();
    
    // 1. Get the list based on Tab (New or Accepted)
    List<AllRequiremtsShopModel> filteredTasks = taskProvider.getFilteredTasks(_selectedTab);

    // 2. Further filter the list based on the Category Name search query
    if (_searchQuery.isNotEmpty) {
      filteredTasks = filteredTasks.where((task) {
        return task.categoryName.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "All Requirements",
          style: TextStyle(color: Color(0xFF333333), fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          // --- Tab Bar ---
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomTab(
                    text: "New Requirements",
                    isSelected: _selectedTab == 0,
                    onTap: () {
                      setState(() {
                        _selectedTab = 0;
                        _searchController.clear(); // Clear search when switching tabs
                        _searchQuery = "";
                      });
                    },
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: CustomTab(
                    text: "Accepted",
                    isSelected: _selectedTab == 1,
                    onTap: () {
                      setState(() {
                        _selectedTab = 1;
                        _searchController.clear();
                        _searchQuery = "";
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          // --- Search Bar (Visible for New Requirements) ---
          if (_selectedTab == 0)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F8F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search by category...",
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: _searchQuery.isNotEmpty 
                      ? IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: () {
                            _searchController.clear();
                            setState(() => _searchQuery = "");
                          },
                        )
                      : null,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),

          // --- Dynamic Content Area ---
          Expanded(
            child: _selectedTab == 0
                ? _buildNewRequirementsView(taskProvider, filteredTasks)
                : EstimateListScreen(), // Shows the screen when Tab 1 is active
          ),
        ],
      ),
    );
  }

  // Widget for Tab 0 Content
  Widget _buildNewRequirementsView(ShopAllRequirementsProvider taskProvider, List<AllRequiremtsShopModel> filteredTasks) {
    if (taskProvider.isLoading) {
      return const Center(child: CircularProgressIndicator(color: Color(0xFFC63D18)));
    }
    
    if (filteredTasks.isEmpty) {
      return Center(
        child: Text(
          _searchQuery.isEmpty ? "No new requirements found." : "No results for '$_searchQuery'",
          style: const TextStyle(color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: filteredTasks.length,
      itemBuilder: (context, index) {
        return RequirementCard(task: filteredTasks[index]);
      },
    );
  }
}

// --- TAB WIDGET ---
class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomTab({super.key, required this.text, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF0ED) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? const Color(0xFFC63D18) : Colors.grey,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

// --- REQUIREMENT CARD ---
class RequirementCard extends StatelessWidget {
  final AllRequiremtsShopModel task;
  const RequirementCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.container_color,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFF5F5F5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.categoryName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF4A5660)),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                "Location - ${task.location}",
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Divider(color: Color(0xFFEEEEEE), thickness: 1),
          ),
          Text(
            task.taskDescription,
            style: const TextStyle(color: Color(0xFF7D848D), fontSize: 13, height: 1.5),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    // Implement remove logic if needed
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFC63D18)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text("Remove", style: TextStyle(color: Color(0xFFC63D18), fontWeight: FontWeight.w500)),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    showEstimateDialog(context, task.taskId);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC63D18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    elevation: 0,
                  ),
                  child: const Text("Add Estimate", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// --- ESTIMATE DIALOG ---
void showEstimateDialog(BuildContext context, String taskId) {
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer<AddEstimateShopProvider>(
        builder: (context, provider, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            title: const Text(
              "Estimate",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Color(0xFF333333)),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Description", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: descriptionController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Enter description...",
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Price", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "₹0/-",
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            side: const BorderSide(color: Color(0xFF9E3127)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("Cancel", style: TextStyle(color: Color(0xFF9E3127), fontSize: 16)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF9E2114), Color(0xFFE85D22)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ElevatedButton(
                            onPressed: provider.isLoading
                                ? null
                                : () async {
                                    if (descriptionController.text.isEmpty || priceController.text.isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(content: Text("Please fill all fields")),
                                      );
                                      return;
                                    }

                                    final shopProfile = Provider.of<ShopProfileProvider>(context, listen: false);

                                    await provider.addEstimate(
                                      taskId,
                                      shopProfile.profile?.shopkeeperId ?? "",
                                      descriptionController.text,
                                      priceController.text,
                                      context,
                                    );

                                    if (!provider.isLoading && provider.errorMessage == null) {
                                      Navigator.pop(context);
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: provider.isLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                                  )
                                : const Text("Send", style: TextStyle(color: Colors.white, fontSize: 16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}