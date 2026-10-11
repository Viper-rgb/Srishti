import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/screens/LoginScreen/login_screen.dart';



class UserRegistrationProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  
  UserRegistrationProvider();

  Future<void> userRegister(
      {required BuildContext context,
      required String name,
      required String gender,
      required String phoneNumber,
      required String email,
      required String address,
      required String password,
      
      required File avatar,
   }) async {
    print('Fetching user_registration API');
    _isLoading = true;
    notifyListeners();
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(
          'https://srishticampus.tech/bloodconnect/viavita_api/customer_reg.php',
        ),
      );
      request.fields.addAll({
        'name': name,
        'gender': gender,
        'phone_number': phoneNumber,
        'email': email,
        'address': address,
        'password': password,
   
        
      });
      request.files
          .add(await http.MultipartFile.fromPath('avatar', avatar.path));
      

      var response = await request.send().timeout(Duration(seconds: 10));
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);

      if (context.mounted) {
        if (response.statusCode == 200 && jsonResponse['success'] == true) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          // Navigator.pushAndRemoveUntil(
          //   context,
          //   MaterialPageRoute(builder: (context) => LoginScreen(method: true)),
          //   (route) => route is OnboardingScreen || route.isFirst,
          // );

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Account successfully registered!")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:   jsonResponse['message'] ?? "Something went wrong"));
        }
      }
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = true;
      notifyListeners();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Request timeout!! try again!")));
    }
  }
}
