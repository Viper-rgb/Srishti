import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ShopRequirementcountProvider with ChangeNotifier {
  Map<String, dynamic>? _counts;
  bool _isLoading = false;

  Map<String, dynamic>? get counts => _counts;
  bool get isLoading => _isLoading;

  Future<void> fetchRequirementCount(String shopId) async {
    _isLoading = true;
    notifyListeners();

    final url = 'https://srishticampus.tech/bloodconnect/viavita_api/shop_requirement_count.php?shopkeeper_id=$shopId';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _counts = json.decode(response.body);
      }
    } catch (e) {
      debugPrint("Error fetching counts: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}