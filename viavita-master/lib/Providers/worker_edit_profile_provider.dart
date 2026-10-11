// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:via_vita_mobile_app/CommonScreens/colors.dart';

// class WorkerEditProfileProvider extends ChangeNotifier {
//   bool _isLoading = false;
//   bool get isLoading => _isLoading;

//   Future<void> updateWorkerProfile({
//     required BuildContext context,
//     required String workerId,
//     required String name,
//     required String gender,
//     required String phoneNumber,
//     required String emailId,
//     required String address,
//     File? avatarImage, // Optional: User might not change the image
//   }) async {
//     _isLoading = true;
//     notifyListeners();

//     try {
//       var uri = Uri.parse("https://srishticampus.tech/bloodconnect/viavita_api/edit_profile_worker.php");
      
//       var request = http.MultipartRequest('POST', uri);

//       // Add Text Fields
//       request.fields['id'] = workerId;
//       request.fields['name'] = name;
//       request.fields['gender'] = gender;
 
//       request.fields['phone_number'] = phoneNumber;
//       request.fields['email_id'] = emailId;

//       request.fields['address'] = address;

//       // Add Image File (Only if the user selected a new one)
//       if (avatarImage != null) {
//         var stream = http.ByteStream(avatarImage.openRead());
//         var length = await avatarImage.length();
        
//         var multipartFile = http.MultipartFile(
//           'avatar',
//           stream,
//           length,
//           filename: avatarImage.path.split('/').last,
//         );
//         request.files.add(multipartFile);
//       }

//       // Send Request
//       var response = await request.send();
//       var responseBody = await response.stream.bytesToString();
//       var jsonResponse = json.decode(responseBody);

//       if (response.statusCode == 200) {
//         if (jsonResponse['success'] == true || jsonResponse['status'] == true) { 
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Profile Updated Successfully!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: colors.app_color_1,),
//           );
//           Navigator.pop(context); // Go back after success
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(jsonResponse['message'] ?? "Update failed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: colors.app_color_1,),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Server error occurred",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: colors.app_color_1,),
//         );
//       }
//     } catch (e) {
//       print("Error updating profile: $e");
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Something went wrong. Please try again.")),
//       );
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';

class WorkerEditProfileProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> updateWorkerProfile({
    required BuildContext context,
    required String workerId,
    required String name,
    required String gender,
    required String phoneNumber,
    required String emailId,
    required String address,
    required String subscriptionExpiry, // Added this parameter
    File? avatarImage, 
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      var uri = Uri.parse("https://srishticampus.tech/bloodconnect/viavita_api/edit_profile_worker.php");
      
      var request = http.MultipartRequest('POST', uri);

      // Add Text Fields
      request.fields['id'] = workerId;
      request.fields['name'] = name;
      request.fields['gender'] = gender;
      request.fields['phone_number'] = phoneNumber;
      request.fields['email'] = emailId;
      request.fields['address'] = address;
      
      // Add Subscription Expiry field
      if (subscriptionExpiry != null) {
        request.fields['subscription_expiry'] = subscriptionExpiry;
      }

      // Add Image File (Only if the user selected a new one)
      if (avatarImage != null) {
        var stream = http.ByteStream(avatarImage.openRead());
        var length = await avatarImage.length();
        
        var multipartFile = http.MultipartFile(
          'avatar',
          stream,
          length,
          filename: avatarImage.path.split('/').last,
        );
        request.files.add(multipartFile);
      }

      // Send Request
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseBody);

      if (response.statusCode == 200) {
        if (jsonResponse['success'] == true || jsonResponse['status'] == true) { 
          ToastManager.showSingle(context, title:"Profile Updated Successfully!",type: ToastificationType.success );
         
          Navigator.pop(context); // Go back after success
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