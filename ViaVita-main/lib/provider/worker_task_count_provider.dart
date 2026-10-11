import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorkerTaskCountProvider with ChangeNotifier {
  Map<String, dynamic>? _taskData;
  bool _isLoading = false;

  Map<String, dynamic>? get taskData => _taskData;
  bool get isLoading => _isLoading;

  Future<void> fetchTaskCount(String workerId) async {
    _isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        'https://srishticampus.tech/bloodconnect/viavita_api/worker_task_count.php?worker_id=$workerId');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        _taskData = json.decode(response.body);
      }
    } catch (e) {
      debugPrint("Error: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
