import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/DataModels/shop_regsiter_model.dart';
// Import your models
import 'package:via_vita_mobile_app/DataModels/worker_register_model.dart';
// Add the import for the Category Model created above
import 'package:via_vita_mobile_app/DataModels/shop_category_model.dart'; 

class ShopRegisterProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  ShopRegisterModel? _workerData;
  ShopRegisterModel? get workerData => _workerData;

  // List to store categories
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

  // --- 2. Register Function ---
  Future<void> registerShopkeeper({
    required String name,
    required String phoneNumber,
    required String email,
    required String state,
    required String district,
    required String address,
    required String shopcategoryid,
    required String password,
    File? idProof,
  }) async {
    _isLoading = true;
    notifyListeners();

    const String url = "https://srishticampus.tech/bloodconnect/viavita_api/shop_keeper_reg.php";

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Normal fields
      request.fields['name'] = name;
      request.fields['phone_number'] = phoneNumber;
      request.fields['email'] = email;
      request.fields['state'] = state;
      request.fields['district'] = district;
      request.fields['address'] = address;
      request.fields['shop_category_id'] = shopcategoryid;
      request.fields['password'] = password;

      // ID Proof file (optional)
      if (idProof != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'id_proof',
            idProof.path,
            filename: idProof.path.split('/').last,
          ),
        );
      }

      var response = await request.send();
      var responseData = await response.stream.bytesToString();

      print("Response: $responseData");

      var jsonData = json.decode(responseData);

      if (jsonData['success'] == true) {
        // Assuming your WorkerRegisterModel can parse this response
        if(jsonData['userDetails'] != null && jsonData['userDetails'].isNotEmpty){
             _workerData = ShopRegisterModel.fromJson(jsonData['userDetails'][0]);
        }
      } else {
        throw jsonData['message'] ?? "Registration failed";
      }
    } catch (e) {
      debugPrint("Register Error: $e");
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}