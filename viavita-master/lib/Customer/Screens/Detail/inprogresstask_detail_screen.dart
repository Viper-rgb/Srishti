import 'package:flutter/material.dart';

class InprogressCustomerDetailScreen extends StatefulWidget {
  final String title;
  final String budget;
  final String location;
  final String deadline;
  final String description;
  final String taskId;

  const InprogressCustomerDetailScreen({
    super.key,
    required this.title,
    required this.budget,
    required this.location,
    required this.deadline,
    required this.description,
    required this.taskId,
  });

  @override
  State<InprogressCustomerDetailScreen> createState() => _InprogressCustomerDetailScreenState();
}

class _InprogressCustomerDetailScreenState extends State<InprogressCustomerDetailScreen> {
  @override
  Widget build(BuildContext context) {
    const Color secondaryTextColor = Color(0xFF78909C);
    const Color badgeBgColor = Color(0xFFFFF3E0);
    const Color badgeTextColor = Color(0xFFFFA726);

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
          'View Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF455A64),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: badgeBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'In Progress',
                    style: TextStyle(
                      color: badgeTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            _buildInfoRow(
              Icons.account_balance_wallet_outlined,
            
              'Budget - ₹ ${widget.budget}/-'
              
            ),
            const SizedBox(height: 15),
            _buildInfoRow(
              Icons.location_on_outlined,
          
              "Location -${ widget.location}"
             
            ),
            const SizedBox(height: 15),
            _buildInfoRow(
              Icons.calendar_today_outlined,
             
             "Expected Deadline - ${widget.deadline}"
           
            ),

            const SizedBox(height: 35),

            const Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF37474F),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF546E7A),
                height: 1.5,
              ),
            ),
            
            // Note: If you don't have separate 'requirements' in your TaskModel, 
            // you can hide this section or use the description again.
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String value,) {
    return Row(
      children: [
        Icon(icon, size: 20,color:Colors.grey,),
        
        const SizedBox(width: 10),
          Text(value, style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w500)),
      ],
    );
  }
}