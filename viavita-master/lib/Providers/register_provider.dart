import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Make sure to add http package

class RegisterProvider extends ChangeNotifier {
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  // The method returns Future<bool> so the UI knows if registration succeeded
  Future<bool> registerCustomer({
    required File? imageFile,
    required String name,
    required String gender,
    required String phonenumber,
    required String email,
    required String address,
    required String password,
  }) async {
    
    const url = 'https://srishticampus.tech/bloodconnect/viavita_api/customer_reg.php';
    
    // 1. Set Loading to true
    _isLoading = true;
    notifyListeners();

    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));

      if (imageFile != null) {
        request.files.add(await http.MultipartFile.fromPath('avatar', imageFile.path));
      }

      request.fields.addAll({
        'name': name,
        'gender': gender,
        'phone_number': phonenumber,
        'email': email,
        'address': address,
        'password': password,
      });

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var jsonData = json.decode(responseBody);

      // 2. Set Loading to false after API call
      _isLoading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        if (jsonData['success'] == true) {
          print('Registration successful');
          return true; // Return Success
        } else {
          print('Error: ${jsonData['message'] ?? 'Unknown error'}');
          return false; // Return Failure
        }
      } else {
        print('Server Error: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error: $error');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}