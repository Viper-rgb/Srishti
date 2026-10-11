import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/DataModels/shop_category_model.dart';

class EditTaskProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<ShopCategoryModel> _categories = [];
  List<ShopCategoryModel> get categories => _categories;

  // --- 1. Fetch Categories for Dropdown ---
  Future<void> fetchCategories() async {
    const String url = "https://srishticampus.tech/bloodconnect/viavita_api/view_categories.php";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == true) {
          final List<dynamic> categoryList = data['categories'];
          _categories = categoryList.map((json) => ShopCategoryModel.fromJson(json)).toList();
          notifyListeners();
        }
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  // --- 2. Update Task (Void function) ---
  Future<void> updateTask({
    required String taskId,
    required String description,
    required String location,
    required String budget,
    required String deadlineDate,
    required String jobCategoryId,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse("https://srishticampus.tech/bloodconnect/viavita_api/customer_edit_task.php"),
        body: {
          'task_id': taskId.toString(),
          'description': description,
          'location': location,
          'budget': budget,
          'deadline_date': deadlineDate,
          'job_category_id': jobCategoryId,
        },
      );
      print(response.body);
      final data = json.decode(response.body);
      _isLoading = false;
      notifyListeners();

      if (data['success'] == true) {
        onSuccess();
      } else {
        onError(data['message'] ?? "Update failed");
      }
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      onError("Connection Error: $e");
    }
  }
}