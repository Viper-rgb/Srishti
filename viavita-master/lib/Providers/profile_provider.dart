import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/DataModels/profile_model.dart';



class ProfileProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  ProfileModel? profile;
  

  Future<bool> fetchProfile(String customerId) async {
    _loading = true;
    notifyListeners();

    final url =
        "https://srishticampus.tech/bloodconnect/viavita_api/view_profile_customer.php?customer_id=$customerId";

    try {
      final response = await http.get(Uri.parse(url));

      print("PROFILE RES: ${response.body}");

      final jsonData = json.decode(response.body);

      if (jsonData["success"] == true) {
        profile = ProfileModel.fromJson(jsonData["userDetails"][0]);

        _loading = false;
        notifyListeners();
        return true;
      } else {
        _loading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      print("PROFILE ERROR: $e");
      _loading = false;
      notifyListeners();
      return false;
    }
  }
  
}
