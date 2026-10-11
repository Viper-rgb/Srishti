import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toastification/toastification.dart';
import 'package:via_vita_mobile_app/CommonScreens/colors.dart';
import 'package:via_vita_mobile_app/CommonScreens/toastwidget.dart';

class ForgotPasswordProvider with ChangeNotifier {
  bool isLoading = false;

  Future<bool> sendResetRequest(String email, BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();

      final response = await http.post(
        Uri.parse("https://srishticampus.tech/bloodconnect/viavita_api/reset_password.php"),
        body: {"email": email},
      );

      isLoading = false;
      notifyListeners();

      final data = jsonDecode(response.body);

      if (data["status"] == "success") {
        // SUCCESS MESSAGE
       ToastManager.showSingle(context, title: data["message"],type: ToastificationType.success);
        
        return true;
      } else {
        // ERROR MESSAGE
         ToastManager.showSingle(context, title: data["message"],type: ToastificationType.error);
       
        return false;
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Something went wrong"), backgroundColor: Colors.red),
      );
      return false;
    }
  }
}
