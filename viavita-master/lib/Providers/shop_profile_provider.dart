import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/DataModels/shop_profile_model.dart';




class ShopProfileProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  ShopprofileModel? profile;

  Future<bool> fetchShopProfile(String shopId) async {
    _loading = true;
    notifyListeners();

    final url =
        "https://srishticampus.tech/bloodconnect/viavita_api/view_shopkeeper_profile.php?id=$shopId";

    try {
      final response = await http.get(Uri.parse(url));
      print(url);

      print("Shop Profile RES: ${response.body}");

      final jsonData = json.decode(response.body);

      if (jsonData["success"] == true) {
        profile = ShopprofileModel.fromJson(jsonData["userDetails"][0]);

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
