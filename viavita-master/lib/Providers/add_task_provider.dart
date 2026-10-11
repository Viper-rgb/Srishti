import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/DataModels/shop_category_model.dart';

class AddTaskProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isSuccess = false;
  String _message = "";

  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;
  String get message => _message;

  // Change: Now a Future<void> instead of Future<bool
  // 
  // >

    List<ShopCategoryModel> _categories = [];
  List<ShopCategoryModel> get categories => _categories;

  // --- 1. Fetch Categories Function ---
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
      } else {
        debugPrint("Failed to load categories");
      }
    } catch (e) {
      debugPrint("Error fetching categories: $e");
    }
  }
  Future<void> addTask({
    required String jobCategory,
    required String description,
    required String location,
    required String budget,
    required String deadlineDate,
    required String customerId,
  }) async {
    _isLoading = true;
    _isSuccess = false; // Reset status before starting
    _message = "";
    notifyListeners();

    final url = Uri.parse('https://srishticampus.tech/bloodconnect/viavita_api/add_task.php');

    try {
      final response = await http.post(
        url,
        body: {
          'job_category': jobCategory,
          'description': description,
          'location': location,
          'budget': budget,
          'deadline_date': deadlineDate,
          'customer_id': customerId,
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(response.body);
        
        // Adjust the condition based on your actual API response JSON
        if (data['status'] == 'success' || data['message'] == 'Task Added Successfully') {
          _isSuccess = true;
          _message = "Task added successfully!";
        } else {
          _isSuccess = false;
          _message = data['message'] ?? "Failed to add task";
        }
      } else {
        _isSuccess = false;
        _message = "Server Error: ${response.statusCode}";
      }
    } catch (e) {
      _isSuccess = false;
      _message = "An error occurred: $e";
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}