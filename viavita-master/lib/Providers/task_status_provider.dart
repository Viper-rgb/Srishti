import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/DataModels/task_model.dart';


class TaskStatusProvider with ChangeNotifier {
  List<TaskModel> _pendingTasks = [];
  List<TaskModel> _inProgressTasks = [];
  List<TaskModel> _completedTasks = [];
  bool _isLoading = false;

  List<TaskModel> get pendingTasks => _pendingTasks;
  List<TaskModel> get inProgressTasks => _inProgressTasks;
  List<TaskModel> get completedTasks => _completedTasks;
  bool get isLoading => _isLoading;

  // Helper to map category ID to a name (Optional, as API returns ID)
  String getCategoryName(String? id) {
    switch (id) {
      case "1": return "Plumbing"; // Example mapping
      case "2": return "Electrical";
      default: return "General Task";
    }
  }

  Future<void> fetchAllTasksStatus(String customerId) async {
    _isLoading = true;
    notifyListeners();

    try {
      // API URLs
      final String pendingUrl = "https://srishticampus.tech/bloodconnect/viavita_api/pending_tasks_customer.php?customer_id=$customerId";
      final String inProgressUrl = "https://srishticampus.tech/bloodconnect/viavita_api/view_inprogress_tasks_customer.php?customer_id=$customerId";
      final String completedUrl = "https://srishticampus.tech/bloodconnect/viavita_api/view_completed_tasks_customer.php?customer_id=$customerId";

      // Fetch all concurrently
      final responses = await Future.wait([
        http.get(Uri.parse(pendingUrl)),
        http.get(Uri.parse(inProgressUrl)),
        http.get(Uri.parse(completedUrl)),
      ]);

      _pendingTasks = _parseResponse(responses[0]);
      _inProgressTasks = _parseResponse(responses[1]);
      _completedTasks = _parseResponse(responses[2]);

    } catch (e) {
      print("Error fetching tasks: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<TaskModel> _parseResponse(http.Response response) {
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Check if success is true or if tasks list exists
      if (data['tasks'] != null) {
        return (data['tasks'] as List)
            .map((item) => TaskModel.fromJson(item))
            .toList();
      }
    }
    return [];
  }
}