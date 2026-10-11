// import 'package:flutter/material.dart';
// import 'package:via_vita_mobile_app/CommonScreens/colors.dart';

// class CompletedTaskDetailScreen extends StatefulWidget {
//   final String title;
//   final String budget;
//   final String location;
//   final String deadline;
//   final String description;
//   final String taskId;

//   const CompletedTaskDetailScreen({
//     super.key,
//     required this.title,
//     required this.budget,
//     required this.location,
//     required this.deadline,
//     required this.description,
//     required this.taskId,
//   });

//   @override
//   State<CompletedTaskDetailScreen> createState() => _CompletedTaskDetailScreenState();
// }

// class _CompletedTaskDetailScreenState extends State<CompletedTaskDetailScreen> {
//   @override
//   Widget build(BuildContext context) {
//     const Color primaryColor = Color(0xFF455A64);
//     const Color secondaryColor = Color.fromARGB(255, 60, 69, 73);
//     const Color badgeBg = Color(0xFFE8F5E9);
//     const Color badgeText = Color(0xFF4CAF50);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           "View Details",
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600,fontSize: 16),
//         ),
//       ),
//       body: Stack(
//         children: [
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     // Dynamic Title
//                     Expanded(
//                       child: Text(
//                         widget.title,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: badgeBg,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       child: const Text(
//                         "Completed",
//                         style: TextStyle(color: badgeText, fontWeight: FontWeight.w600, fontSize: 11),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 25),

//                 // Dynamic Icon Details
//                 _buildIconDetail(Icons.account_balance_wallet_outlined, "Price- ₹ ${widget.budget}/-", secondaryColor),
//                 _buildIconDetail(Icons.location_on_outlined, "Location - ${widget.location}", secondaryColor),
//                 _buildIconDetail(Icons.calendar_month_outlined, "Deadline - ${widget.deadline}", secondaryColor),

//                 const SizedBox(height: 30),

//                 // Dynamic Content Sections
//                 _buildContentSection("Description", widget.description),
//                 _buildContentSection("Requirements", "Standard requirements for ${widget.title}"),
//                 _buildContentSection("Estimate", "Final cost: ₹ ${widget.budget}"),
                
//                 const SizedBox(height: 100), 
//               ],
//             ),
//           ),

//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                   child: SizedBox(
//                     width: double.infinity,
//                     height: 55,
//                     child: OutlinedButton(
//                       style: OutlinedButton.styleFrom(
//                         side: const BorderSide(color: Color(0xFFD32F2F)),
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                       ),
//                       onPressed: () {
                        
//                       },
//                       child: const Text(
//                         "Add Review",
//                         style: TextStyle(color: colors.app_color_1, fontSize: 14, fontWeight: FontWeight.w500),
//                       ),
//                     ),
//                   ),
//                 ),
             
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildIconDetail(IconData icon, String text, Color color) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: Row(
//         children: [
//           Icon(icon, size: 20, color: color),
//           const SizedBox(width: 10),
//           Text(text, style: TextStyle(fontSize: 13, color: color.withOpacity(0.9), fontWeight: FontWeight.w500)),
//         ],
//       ),
//     );
//   }

//   Widget _buildContentSection(String title, String content) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 25.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF263238))),
//           const SizedBox(height: 8),
//           Text(
//             content,
//             style: const TextStyle(fontSize: 13, color: Color(0xFF607D8B), height: 1.4),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';
import 'package:via_vita_mobile_app/Providers/profile_provider.dart';
import 'package:via_vita_mobile_app/Providers/review_provider.dart';

class CompletedTaskDetailScreen extends StatefulWidget {
  final String title;
  final String budget;
  final String location;
  final String deadline;
  final String description;
  final String taskId;

  const CompletedTaskDetailScreen({
    super.key,
    required this.title,
    required this.budget,
    required this.location,
    required this.deadline,
    required this.description,
    required this.taskId,
  });

  @override
  State<CompletedTaskDetailScreen> createState() => _CompletedTaskDetailScreenState();
}

class _CompletedTaskDetailScreenState extends State<CompletedTaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    const Color secondaryColor = Color.fromARGB(255, 60, 69, 73);
    const Color badgeBg = Color(0xFFE8F5E9);
    const Color badgeText = Color(0xFF4CAF50);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "View Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(color: badgeBg, borderRadius: BorderRadius.circular(6)),
                      child: const Text("Completed", style: TextStyle(color: badgeText, fontWeight: FontWeight.w600, fontSize: 11)),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                _buildIconDetail(Icons.account_balance_wallet_outlined, "Price- ₹ ${widget.budget}/-", secondaryColor),
                _buildIconDetail(Icons.location_on_outlined, "Location - ${widget.location}", secondaryColor),
                _buildIconDetail(Icons.calendar_month_outlined, "Deadline - ${widget.deadline}", secondaryColor),
                const SizedBox(height: 30),
                _buildContentSection("Description", widget.description),
                _buildContentSection("Requirements", "Standard requirements for ${widget.title}"),
                const SizedBox(height: 100),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFB73315)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    // SHOW THE DIALOG HERE
                    showDialog(
                      context: context,
                      builder: (context) => ReviewDialog(taskId: widget.taskId),
                    );
                  },
                  child: const Text(
                    "Add Review",
                    style: TextStyle(color: Color(0xFFB73315), fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconDetail(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 10),
          Text(text, style: TextStyle(fontSize: 13, color: color.withOpacity(0.9), fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildContentSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFF263238))),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 13, color: Color(0xFF607D8B), height: 1.4)),
        ],
      ),
    );
  }
}

// --- 4. THE CUSTOM REVIEW DIALOG (Matching UI Image) ---
class ReviewDialog extends StatefulWidget {
  final String taskId;
  const ReviewDialog({super.key, required this.taskId});

  @override
  State<ReviewDialog> createState() => _ReviewDialogState();
}

class _ReviewDialogState extends State<ReviewDialog> {
  int _rating = 1;
  final TextEditingController _reviewCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Watch the provider for loading state
    final prov = Provider.of<ReviewProvider>(context);
    final customer=Provider.of<ProfileProvider>(context);
    const Color themeRed = Color(0xFFB73315);

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      contentPadding: const EdgeInsets.all(20),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Profile Card
           
            const SizedBox(height: 20),
            const Text("Rating", style: TextStyle(fontWeight: FontWeight.w600)),
            // Star Rating Row
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  onPressed: () => setState(() => _rating = index + 1),
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: index < _rating ? Colors.orange : Colors.grey[300],
                    size: 30,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                );
              }),
            ),
            const SizedBox(height: 20),
            const Text("Review", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            // Review Text Field
            TextField(
              controller: _reviewCtrl,
              maxLines: 4,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF8F9FA),
                hintText: "Enter your review...",
                hintStyle: TextStyle(fontSize: 14),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 25),
            // Actions
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      side: const BorderSide(color: themeRed),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Cancel", style: TextStyle(color: themeRed)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
  onPressed: prov.isLoading 
    ? null // Disable button while loading
    : () {
        // 1. Get the customer ID safely
        String customerId = customer.profile?.id?.toString() ?? "";

        // 2. Validate (Optional but recommended)
        if (_reviewCtrl.text.isEmpty) {
          ToastManager.showSingle(context, title: "Please enter a review",type: ToastificationType.info);
         
          return;
        }

        // 3. Call the Provider method
        prov.submitReview(
          taskId: widget.taskId,
          customer_id: customerId,
          rating: _rating, // Pass the local state variable
          review: _reviewCtrl.text, // Pass the text from controller
          onSuccess: () {
            Navigator.pop(context); // Close dialog
              ToastManager.showSingle(context, title: "Review Sent Successfully!",type: ToastificationType.success);
            
          },
          onError: (msg) {
               ToastManager.showSingle(context, title: msg,type: ToastificationType.error);
          
          },
        );
      },
  style: ElevatedButton.styleFrom(
    backgroundColor: themeRed,
    padding: const EdgeInsets.symmetric(vertical: 15),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  child: prov.isLoading
      ? const SizedBox(
          height: 20, 
          width: 20, 
          child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
        )
      : const Text("Send", style: TextStyle(color: Colors.white)),
),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}