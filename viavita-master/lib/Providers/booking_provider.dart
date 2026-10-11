import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/DataModels/bookingmodel.dart';


class BookingProvider with ChangeNotifier {
  Bookingmodel? _task;
 
  List<BookingEstimateModel> _estimates = [];
 
  
  bool _isLoading = false;

  // Getters
  Bookingmodel? get task => _task;
  List<BookingEstimateModel> get estimates => _estimates;
  bool get isLoading => _isLoading;

  Future<void> fetchTaskDetails(int taskId) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://srishticampus.tech/bloodconnect/viavita_api/customer_view_pending_estimates.php?task_id=$taskId');
    print(url);

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(response.body);

        if (data['success'] == true) {
          
          _task = Bookingmodel.fromJson(data['task']);
          
          // Store Estimates directly
          _estimates = (data['estimates'] as List)
              .map((e) => BookingEstimateModel.fromJson(e))
              .toList();
        }
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}