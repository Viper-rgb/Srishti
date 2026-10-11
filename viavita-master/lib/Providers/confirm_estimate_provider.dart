import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConfirmEstimateProvider with ChangeNotifier {
  bool _isLoading = false;
  String _message = "";
  bool _isSuccess = false;

  bool get isLoading => _isLoading;
  String get message => _message;
  bool get isSuccess => _isSuccess;

  Future<void> confirmEstimate(int estimateId) async {
    const String url = "https://srishticampus.tech/bloodconnect/viavita_api/customer_confirm_estimate.php";
    
    _isLoading = true;
    _message = "";
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(url),
        body: {
          'estimate_id': estimateId.toString(),
        },
      );

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        _isSuccess = data['success'] ?? false;
        _message = data['message'] ?? "Something went wrong";
      } else {
        _isSuccess = false;
        _message = "Server Error: ${response.statusCode}";
      }
    } catch (e) {
      _isSuccess = false;
      _message = "Connection Error: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}