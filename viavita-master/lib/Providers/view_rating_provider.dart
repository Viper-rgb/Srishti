import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/DataModels/review-model.dart';

class ViewRatingProvider with ChangeNotifier {
  WorkerResponse? _data;
  bool _isLoading = false;
  String _errorMessage = '';

  WorkerResponse? get data => _data;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchWorkerReviews(String workerId) async {
    final url = 'https://srishticampus.tech/bloodconnect/viavita_api/view_review.php?worker_id=$workerId';
    
    _isLoading = true;
    _errorMessage = '';
    _data = null; // Clear previous data while loading
    notifyListeners();

    try {
      print("Fetching reviews from: $url"); // Debug print
      final response = await http.get(Uri.parse(url));
      
      print("Response Body: ${response.body}"); // Debug print

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonBody = json.decode(response.body);
        
        // Check if the API returned a logic error (e.g. status: false)
        // Adjust this based on your actual API failure response structure
        if (jsonBody['status'] == false) {
           _errorMessage = jsonBody['message'] ?? 'No reviews found or worker does not exist.';
        } else {
           _data = WorkerResponse.fromJson(jsonBody);
        }
        
      } else {
        _errorMessage = 'Server Error. Status Code: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Connection Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}