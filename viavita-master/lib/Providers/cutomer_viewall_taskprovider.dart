import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/DataModels/customer_viewall_taskmodel.dart';


class CutomerViewallTaskprovider with ChangeNotifier {
  List<CustomerViewallTaskmodel> _tasks = [];
  bool _isLoading = false;
  String _errorMessage = "";
  String _searchQuery = "";

void setSearchQuery(String query) {
  _searchQuery = query.toLowerCase();
  notifyListeners(); // This triggers the UI to rebuild
}

List<CustomerViewallTaskmodel> get filteredTasks {
  if (_searchQuery.isEmpty) {
    return tasks; // Return all tasks if search is empty
  }
  return tasks.where((task) {
    // This searches by Category Name
    return task.categoryname.toLowerCase().contains(_searchQuery);
  }).toList();
}

  List<CustomerViewallTaskmodel> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchNewCustomerViewallTasks(String? customerId) async {
    _isLoading = true;
    _errorMessage = "";
    // notifyListeners() inside a build phase can cause errors, 
    // but here it is called from initState/Refresh button.
    notifyListeners();

    final url = Uri.parse(
        "https://srishticampus.tech/bloodconnect/viavita_api/view_my_tasks_customer.php?customer_id=$customerId");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['success'] == true) {
          List<dynamic> taskList = data['tasks'];
          _tasks = taskList.map((task) => CustomerViewallTaskmodel.fromJson(task)).toList();
        } else {
          _errorMessage = data['message'] ?? "No tasks found.";
          _tasks = [];
        }
      } else {
        _errorMessage = "Server Error: ${response.statusCode}";
      }
    } catch (e) {
      _errorMessage = "Network Error. Please try again.";
      print("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}