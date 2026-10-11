import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workers_app/screens/workaccess_bottom_screen.dart';
import 'package:workers_app/widget/toast_widget.dart';

import 'package:workers_app/widget/toastification.dart';

class TaskActionProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final String baseUrl = "https://srishticampus.tech/bloodconnect/viavita_api";

  /// Start Task API
  Future<void> startTask(String taskId, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/worker_start_task.php'),
        // FIX: Removed jsonEncode. 
        // Passing a Map directly sends data as 'application/x-www-form-urlencoded'
        // which PHP needs to populate the $_POST variable.
        body: {
          "task_id": taskId,
        },
      );

      print("Response Body: ${response.body}");

      final data = jsonDecode(response.body);

      if (data['success'] == true) {
        ToastManager.showSingle(context, title: 'Task started successfully',type: ToastificationType.success);
         Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkerBottomscreen()));
        
      
      } else {
         ToastManager.showSingle(context, title:data['message'] ?? "Failed to start task",type: ToastificationType.error);
       
      }
    } catch (e) {
      print("Provider Error: $e");
         ToastManager.showSingle(context, title:"Connection error: $e",type: ToastificationType.info);
      
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Complete Task API
  Future<void> completeTask(String taskId, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/worker_complete_task.php'),
        // FIX: Removed jsonEncode to support PHP $_POST
        body: {
          "task_id": taskId,
        },
      );

      final data = jsonDecode(response.body);

      if (data['success'] == true) {
           ToastManager.showSingle(context, title: 'Task completed successfully',type: ToastificationType.success);
       
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WorkerBottomscreen()));
      } else {
         ToastManager.showSingle(context, title: data['message'] ?? "Failed to complete task",type: ToastificationType.error);
       
      }
    } catch (e) {
         ToastManager.showSingle(context, title:"Connection error: $e",type: ToastificationType.info);
     
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}