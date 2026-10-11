import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart'; // Ensure this path is correct
import 'package:via_vita_mobile_app/Providers/view_rating_provider.dart';
import 'package:via_vita_mobile_app/Providers/worker_profile_provider.dart';

class WorkerReviewScreen extends StatefulWidget {
  const WorkerReviewScreen({super.key});

  @override
  State<WorkerReviewScreen> createState() => _WorkerReviewScreenState();
}

class _WorkerReviewScreenState extends State<WorkerReviewScreen> {
  @override
  void initState() {
    super.initState();

    // Fetch data after the widget frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadReviews();
    });
  }

  void _loadReviews() {
    // 1. Get the worker profile provider (listen: false is crucial here)
    final workerProfileProvider = Provider.of<WorkerProfileProvider>(context, listen: false);

    // 2. Get the ID safely.
    // We add .toString() to ensure safety if the model has it as an int or String
    final String workerId = workerProfileProvider.profile?.workerId?.toString() ?? "";

    // 3. Check if ID is valid before calling API
    if (workerId.isNotEmpty && workerId != "0") {
      print("Fetching reviews for Worker ID: $workerId");
      Provider.of<ViewRatingProvider>(context, listen: false).fetchWorkerReviews(workerId);
    } else {
      print("Error: Worker ID is missing or invalid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Worker Reviews", style: TextStyle(fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Consumer<ViewRatingProvider>(
        builder: (context, provider, child) {
          // 1. Show Loading
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Show Error
          if (provider.errorMessage.isNotEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  provider.errorMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          }

          // 3. Show Empty/Null Data
          if (provider.data == null) {
            return const Center(child: Text("No reviews found."));
          }

          final workerData = provider.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Summary Card ---
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    // Using a fallback color if your colors file fails
                    color: Colors.blue.withOpacity(0.1), 
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue.withOpacity(0.3)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Worker ID: ${workerData.workerId}",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "${workerData.averageRating} ⭐",
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Text("Average Rating", style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "${workerData.totalReviews}",
                                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Text("Total Reviews", style: TextStyle(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 20),
                const Text(
                  "Recent Reviews",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 10),

                // --- Reviews List ---
                Expanded(
                  child: workerData.reviews.isEmpty
                      ? const Center(child: Text("No reviews yet."))
                      : ListView.builder(
                          itemCount: workerData.reviews.length,
                          itemBuilder: (context, index) {
                            final review = workerData.reviews[index];
                            return Card(
                              elevation: 2,
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Customer ID
                                        Text(
                                          "Customer #${review.customerId}",
                                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                        ),
                                        // Date
                                        Text(
                                          review.createdDate,
                                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    // Stars
                                    Row(
                                      children: List.generate(5, (starIndex) {
                                        return Icon(
                                          starIndex < review.rating ? Icons.star : Icons.star_border,
                                          color: Colors.amber,
                                          size: 18.0,
                                        );
                                      }),
                                    ),
                                    const SizedBox(height: 8),
                                    // Review Text
                                    Text(
                                      review.review,
                                      style: const TextStyle(fontSize: 14, height: 1.4),
                                    ),
                                  ],
                                ),
                              ),
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