import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:via_vita_mobile_app/DataModels/view_estimate_model.dart';


class ViewEstimateProvider with ChangeNotifier {
  List<EstimateModel> _estimates = [];
  bool _isLoading = false;

  List<EstimateModel> get estimates => _estimates;
  bool get isLoading => _isLoading;

  Future<void> fetchEstimates(String shopkeeperId) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        'https://srishticampus.tech/bloodconnect/viavita_api/shop_view_added_estimates.php?shopkeeper_id=$shopkeeperId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(response.body);

        if (decodedData['success'] == true) {
          final List<dynamic> estimateData = decodedData['estimates'];
          _estimates = estimateData.map((item) => EstimateModel.fromJson(item)).toList();
        } else {
          _estimates = [];
        }
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}