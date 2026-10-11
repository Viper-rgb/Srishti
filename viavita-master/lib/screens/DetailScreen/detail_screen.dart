import 'package:flutter/material.dart';
import 'package:via_vita_mobile_app/color/colors.dart';


class PaintingDetailsScreen extends StatefulWidget {
  const PaintingDetailsScreen({super.key});

  @override
  State<PaintingDetailsScreen> createState() => _PaintingDetailsScreenState();
}

class _PaintingDetailsScreenState extends State<PaintingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.background_color,
      appBar: AppBar(
         backgroundColor: colors.background_color,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,size: 17,),
          onPressed: () {
            Navigator.pop(context);
            // Handle back button press
          },
        ),
        title: Text('View Details',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Painting',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: colors.task_progress_color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Pending',
                    style: TextStyle(
                      fontSize: 11,
                      color: colors.progress_pending_txtcolor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildDetailRow(
              icon: Icons.account_balance_wallet,
              label: 'Budget',
              value: '₹ 8,000/-',
            ),
            _buildDetailRow(
              icon: Icons.location_on,
              label: 'Location',
              value: 'Chennai',
            ),
            _buildDetailRow(
              icon: Icons.calendar_today,
              label: 'Expected Dead line',
              value: '12 July, 2025',
            ),
            SizedBox(height: 30),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We need professional painters to paint 2 bedrooms and a living room. The work includes surface preparation, applying primer, and finishing coats. All materials, including paint and brushes, will be provided. The job should be completed neatly within 3 days with high-quality results.',
              style: TextStyle(
                fontSize: 12,
                height: 1.5,
                color: colors.task_text_color
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                    colors.app_color_1,colors.app_color_2
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextButton(
                  onPressed: () {
                    // Handle edit button press
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade700),
          SizedBox(width: 10),
          Text(
            '$label - ',
            style: TextStyle(
              fontSize: 12,
              color: colors.task_text_color,fontWeight: FontWeight.bold
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
               color: colors.task_text_color
            ),
          ),
        ],
      ),
    );
  }
}

