import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';



class AddEstimateShopProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
   String? errorMessage; 

  Future<void> addEstimate(String taskId, String shopkeeperId,String description, String estimateamount, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('https://srishticampus.tech/bloodconnect/viavita_api/add_estimate_shop.php');
    
    try {
      final response = await http.post(
        url,
        body: {
          "task_id": taskId,
          "shopkeeper_id": shopkeeperId,
          "description": description,
          "estimate_amount": estimateamount ,
          
        },
      );

      print("Response: ${response.body}");
      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        // Show Success Toast
        ToastManager.showSingle(context, 
          title: data['message'] ?? "Estimate added successfully!", 
          type: ToastificationType.success
        );
        
        // Navigate to Bottom Screen
        
     
      } else {
        ToastManager.showSingle(context, 
          title: data['message'] ?? "Failed to add estimate", 
          type: ToastificationType.error
        );
      }
    } catch (e) {
       errorMessage = e.toString();
      print("Error: $e");
      ToastManager.showSingle(context, 
        title: "Error: Could not connect to server", 
        type: ToastificationType.info
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}