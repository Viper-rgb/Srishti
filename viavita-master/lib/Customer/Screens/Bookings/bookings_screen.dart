import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_vita_mobile_app/Customer/Screens/Bookings/booking_detail_screen.dart';
import 'package:via_vita_mobile_app/DataModels/bookingmodel.dart';
import 'package:via_vita_mobile_app/Providers/booking_provider.dart';


class BookingScreen extends StatefulWidget {
  final int taskId;
  const BookingScreen( {super.key, required this.taskId});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<BookingProvider>(context, listen: false).fetchTaskDetails(widget.taskId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Bookings", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500)),
      ),
      body: Consumer<BookingProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator(color: Color(0xFFC62828)));
          }

          if (provider.task == null || provider.estimates!.isEmpty) {
            return const Center(child: Text("No Pending Estimates Found"));
          }

          final task = provider.task;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Container(
                  decoration: BoxDecoration(color: const Color(0xFFF8F9FA), borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search here...",
                      prefixIcon: Icon(Icons.search, color: Colors.grey[800]),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 25),

                // List of Dynamic Booking Cards from API
                RefreshIndicator(
                  onRefresh: () async {
 
    await Future.delayed(Duration(seconds: 1));
  }, 
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.estimates!.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 20),
                    itemBuilder: (context, index) {
                      final estimate = provider.estimates[index];
                      return BookingCard(
                        estimate: estimate,
                        task: task,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final BookingEstimateModel estimate;
  final Bookingmodel? task;

  const BookingCard({super.key, required this.estimate, this.task});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingDetailScreen(task: task, estimate: estimate)));
      },
      child: Container(
        decoration: BoxDecoration(color: const Color(0xFFFFFAF9), borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Header
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFFFFE5DE), borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
                        width: 60, height: 60, fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(estimate.shopName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        Text("Phone: ${estimate.shopPhone}", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
      
              // Service (Task Description) & Price
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      task?.description ?? "Service",
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text("₹${estimate.amount}/-", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red)),
                ],
              ),
              const SizedBox(height: 20),
      
              // Dates from API
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDateColumn("Posted On", task?.deadline.split(" ")[0] ?? "N/A"),
                  _buildDateColumn("Deadline", task?.deadline ?? "N/A"),
                ],
              ),
              const SizedBox(height: 25),
      
            
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateColumn(String label, String date) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
        Text(date, style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
      ],
    );
  }
}
