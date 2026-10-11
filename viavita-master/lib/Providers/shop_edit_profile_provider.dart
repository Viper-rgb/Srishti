import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';

class ShopEditProfileProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> updateShopProfile({
    required BuildContext context,
    required String id,
    required String name,
    required String phoneNumber,
    required String emailId,
    required String district,
    required String state,
    required String address,
    required String shopCategoryId,
    File? image, // Renamed from avatarImage for clarity
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      // Check your API endpoint URL
      var uri = Uri.parse("https://srishticampus.tech/bloodconnect/viavita_api/edit_profile_shopkeeper.php");
      
      var request = http.MultipartRequest('POST', uri);

      // --- Add Text Fields ---
      request.fields['id'] = id;
      request.fields['name'] = name;
      request.fields['phone_number'] = phoneNumber;
      request.fields['emailid'] = emailId; // Note: Ensure your PHP script expects 'emailid' (not 'email_id')
      request.fields['district'] = district;
      request.fields['state'] = state;
      request.fields['address'] = address;
      request.fields['shop_category_id'] = shopCategoryId;

      // --- Add Image File ---
      if (image != null) {
        var stream = http.ByteStream(image.openRead());
        var length = await image.length();
        
        var multipartFile = http.MultipartFile(
          'image', // Note: Check if PHP expects 'avatar' or 'image'
          stream,
          length,
          filename: image.path.split('/').last,
        );
        request.files.add(multipartFile);
      }

      // --- Send Request ---
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      
      // Print for debugging
      print("Response: $responseBody");

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(responseBody);
        if (jsonResponse['success'] == true || jsonResponse['status'] == true) { 
          ToastManager.showSingle(context, title:"Profile Updated Successfully!",type: ToastificationType.success );
         
          Navigator.pop(context); 
        } else {
            ToastManager.showSingle(context, title:jsonResponse['message'] ?? "Update failed",type: ToastificationType.error );
          
        }
      } else {
             ToastManager.showSingle(context, title:"Server error occurred",type: ToastificationType.info );
       
      }
    } catch (e) {
      print("Error updating profile: $e");
         ToastManager.showSingle(context, title:"Something went wrong. Please try again.",type: ToastificationType.info );
      
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}