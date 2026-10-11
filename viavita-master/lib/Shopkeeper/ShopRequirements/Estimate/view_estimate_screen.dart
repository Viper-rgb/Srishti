import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_vita_mobile_app/Providers/shop_profile_provider.dart';
import 'package:via_vita_mobile_app/Providers/view_estimate_provider.dart';
import 'package:via_vita_mobile_app/ShopKeeper/Detail/estimate_detail_screen.dart';


class EstimateListScreen extends StatefulWidget {
  @override
  State<EstimateListScreen> createState() => _EstimateListScreenState();
}

class _EstimateListScreenState extends State<EstimateListScreen> {
  @override
 void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final ShopId = Provider.of<ShopProfileProvider>(context, listen: false).profile?.shopkeeperId ?? "";
      
      // Fetch data for all three categories
      Provider.of<ViewEstimateProvider>(context, listen: false).fetchEstimates(ShopId);
   
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     
      body: Consumer<ViewEstimateProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator(color: Colors.blueGrey));
          }

          if (provider.estimates.isEmpty) {
            return Center(child: Text("No estimates found"));
          }

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: provider.estimates.length,
            itemBuilder: (context, index) {
              final item = provider.estimates[index];
              return EstimateCard(estimate: item);
            },
          );
        },
      ),
    );
  }
}

class EstimateCard extends StatelessWidget {
  final dynamic estimate;

  const EstimateCard({required this.estimate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewDetailsPage(estimate: estimate,)));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xFFFEF8F8), // Light pinkish/white background from image
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: Offset(0, 5),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              estimate.categoryName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A5667), // Dark grey/blue color
              ),
            ),
            SizedBox(height: 8),
            // Location Row
            Row(
              children: [
                Icon(Icons.location_on_outlined, size: 18, color: Colors.grey),
                SizedBox(width: 5),
                Text(
                  "Location - ${estimate.location}",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Divider
            Divider(color: Colors.grey.shade200, thickness: 1),
            SizedBox(height: 10),
            // Description
            Text(
              estimate.taskDescription,
              style: TextStyle(
                fontSize: 12,
                height: 1.5, // Line spacing
                color: Colors.grey.shade700,
              ),
            ),
            SizedBox(height: 10),
            // Added a small badge for the Status (Optional but helpful)
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Text(
            //     "Status: ${estimate.estimateStatus}",
            //     style: TextStyle(
            //       fontWeight: FontWeight.w600,
            //       fontSize: 12,
            //       color: Colors.blueGrey,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}