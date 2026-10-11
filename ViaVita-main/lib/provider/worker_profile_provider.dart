import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workers_app/data/models/workers_model.dart';



class WorkerProfileProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  WorkerProfileModel? profile;

  Future<bool> fetchWorkerProfile(String workerId) async {
    _loading = true;
    _errorMessage = '';
    notifyListeners();

    final url =
        "https://srishticampus.tech/bloodconnect/viavita_api/view_profile_worker.php?id=$workerId";

    try {
      final response = await http.get(Uri.parse(url));
      debugPrint("Worker Profile RES: ${response.body}");

      final dynamic decoded = json.decode(response.body);
      final jsonData = decoded is Map<String, dynamic>
          ? decoded
          : (decoded is Map ? Map<String, dynamic>.from(decoded) : <String, dynamic>{});

      final successFlag = jsonData['success'] == true || jsonData['status'] == 'success';
      final userDetails = jsonData['userDetails'];

      if (successFlag && userDetails is List && userDetails.isNotEmpty) {
        profile = WorkerProfileModel.fromJson(userDetails[0]);
        _loading = false;
        _errorMessage = '';
        notifyListeners();
        return true;
      }

      final message = (jsonData['message'] ??
              jsonData['error'] ??
              jsonData['details'] ??
              'Unable to load profile details')
          .toString();

      profile = null;
      _errorMessage = message;
      _loading = false;
      notifyListeners();
      return false;
    } catch (e) {
      debugPrint("PROFILE ERROR: $e");
      profile = null;
      _errorMessage = 'Exception: $e';
      _loading = false;
      notifyListeners();
      return false;
    }
  }
}
