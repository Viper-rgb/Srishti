// ... (previous imports)

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';
import 'package:via_vita_mobile_app/DataModels/bookingmodel.dart';
import 'package:via_vita_mobile_app/Providers/confirm_estimate_provider.dart';

class BookingDetailScreen extends StatelessWidget {
  final Bookingmodel? task;
  final BookingEstimateModel estimate;

  const BookingDetailScreen({
    super.key, 
    required this.task, 
    required this.estimate
  });

  @override
  Widget build(BuildContext context) {
    const Color titleColor = Color(0xFF455A64);
    const Color headingColor = Color(0xFF333333);
    const Color bodyTextColor = Color(0xFF616161);
    
    // Access the provider
    final estimateProv = Provider.of<ConfirmEstimateProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Booking Details',
          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              estimate.shopName,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: titleColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Estimate Amount: ₹${estimate.amount}",
              style: const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),

            _buildSection(
              title: 'Task Description',
              content: task?.description ?? "No description provided.",
              headingColor: headingColor,
              textColor: bodyTextColor,
            ),

            const SizedBox(height: 30),

            _buildSection(
              title: 'Shopkeeper Remarks / Requirements',
              content: estimate.shopName, 
              headingColor: headingColor,
              textColor: bodyTextColor,
            ), 
            
            const SizedBox(height: 50),
          
            // --- UPDATED CONFIRM BUTTON ---
            GestureDetector(
              onTap: estimateProv.isLoading 
                ? null // Disable button while loading
                : () async {
                  // Trigger API call using estimate ID from your model
                  // Make sure your BookingEstimateModel has 'id' or 'estimateId'
                  await estimateProv.confirmEstimate(int.parse(estimate.estimateId.toString()));

                  if (context.mounted) {
                    // Show success/error message
                    ToastManager.showSingle(context, title: estimateProv.message,type: ToastificationType.success);
                  

                    // If successful, go back to previous screen
                    if (estimateProv.isSuccess) {
                      Navigator.pop(context);
                    }
                  }
                },
              child: Container(
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(colors: [
                    colors.app_color_1,
                    colors.app_color_2
                  ]),
                ),
                child: Center(
                  child: estimateProv.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'Confirm',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required Color headingColor,
    required Color textColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: headingColor),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 13, height: 1.5, color: textColor),
        ),
      ],
    );
  }
}