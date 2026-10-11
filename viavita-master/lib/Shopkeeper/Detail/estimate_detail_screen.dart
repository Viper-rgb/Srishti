import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_vita_mobile_app/DataModels/view_estimate_model.dart';
import 'package:via_vita_mobile_app/Providers/view_estimate_provider.dart';


class ViewDetailsPage extends StatefulWidget {
   final EstimateModel estimate;
  const ViewDetailsPage({super.key, required this.estimate});

  @override
  State<ViewDetailsPage> createState() => _ViewDetailsPageState();
}

class _ViewDetailsPageState extends State<ViewDetailsPage> {
  @override
  Widget build(BuildContext context) {
    // Custom colors based on the image
    Color primaryTextColor = Colors.black;
    const Color secondaryTextColor = Color(0xFF64748B); // Grey
       final estimateData = widget.estimate;
        Provider.of<ViewEstimateProvider>(context).estimates.firstWhere((element) => element.estimateId == widget.estimate.estimateId);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'View Details',
          style: TextStyle(
            color: primaryTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              estimateData.categoryName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: primaryTextColor,
              ),
            ),
            const SizedBox(height: 30),

            // Icon Rows
            _buildInfoRow(Icons.account_balance_wallet_outlined, 'Price - ₹ ${estimateData.estimateAmount}/-', secondaryTextColor),
            const SizedBox(height: 15),
            _buildInfoRow(Icons.location_on_outlined, 'Location - ${estimateData.location}', secondaryTextColor),
            const SizedBox(height: 15),
            _buildInfoRow(Icons.calendar_today_outlined, 'Expected Dead line - ${estimateData.deadlineDate}', secondaryTextColor),
            
            const SizedBox(height: 35),

            // Requirements Section
            Text(
              'Requirements',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: primaryTextColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              estimateData.taskDescription,
              style: TextStyle(
                fontSize: 13,
                color: secondaryTextColor,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 35),

            // Estimate Section
           Text(
              'Estimate',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: primaryTextColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              estimateData.estimateDescription,
              style: TextStyle(
                fontSize: 13,
                color: secondaryTextColor,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 40),

            // Final Price
             Text(
              'Price - ₹${estimateData.estimateAmount}/-',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: primaryTextColor,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the icon + text rows
  Widget _buildInfoRow(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, size: 22, color: color),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: color,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}