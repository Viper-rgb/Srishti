import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';
import 'package:via_vita_mobile_app/DataModels/all_requiremts_shop_model.dart';
import 'package:via_vita_mobile_app/Worker/WokerBottom/worker_bottom_screen.dart';



class ShopAllRequirementsProvider with ChangeNotifier {
  List<AllRequiremtsShopModel> _tasks = [];
  bool _isLoading = false;
  String _errorMessage = "";
   bool isSubmitting = false;

  List<AllRequiremtsShopModel> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
   String _message = "";
  String get message => _message;
    String _searchQuery = "";

  // Method to update search query from UI
  void setSearchQuery(String query) {
    _searchQuery = query.toLowerCase();
    notifyListeners(); // Rebuilds the UI when typing
  }

  // Fetch data from API
  Future<void> fetchTasks() async {
    _isLoading = true;
    _errorMessage = "";
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(
          "https://srishticampus.tech/bloodconnect/viavita_api/view_task_requiremnts_shop.php"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(response.body);
        if (data['success'] == true) {
          final List tasksJson = data['tasks'];
          _tasks = tasksJson.map((json) => AllRequiremtsShopModel.fromJson(json)).toList();
        } else {
          _errorMessage = data['message'] ?? "Failed to load tasks";
        }
      } else {
        _errorMessage = "Server Error: ${response.statusCode}";
      }
    } catch (e) {
      _errorMessage = "Connection Error: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Filter logic for tabs
  List<AllRequiremtsShopModel> getFilteredTasks(int tabIndex) {
    if (tabIndex == 0) return _tasks; // All
    if (tabIndex == 1) return _tasks.where((t) => t.taskStatus == "2").toList(); // Accepted
    if (tabIndex == 2) return _tasks.where((t) => t.taskStatus == "3").toList(); // Rejected
    return [];
  }
}