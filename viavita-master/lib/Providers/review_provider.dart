import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

// --- 1. PROVIDER & SERVICE ---
class ReviewProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // Returning void as requested
  Future<void> submitReview({
    required String taskId,
    required String customer_id,
    required int rating,
    required String review,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse("https://srishticampus.tech/bloodconnect/viavita_api/add_review.php"),
        body: {
          'task_id': taskId,
          'customer_id': customer_id,
          'rating': rating.toString(),
          'review': review,
        },
      );

      if (response.statusCode == 200) {
        // You can parse JSON here if needed: var data = jsonDecode(response.body);
        onSuccess();
        print(response.body);
      } else {
        onError("Server error: ${response.statusCode}");
      }
    } catch (e) {
      onError("Network error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}



