import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:workers_app/data/models/api_models.dart';

class InProgressTaskProvider with ChangeNotifier {
  List<AcceptedTaskModel> _tasks = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<AcceptedTaskModel> get tasks => _tasks;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  List<AcceptedTaskModel> _parseTasks(dynamic payload) {
    if (payload is! List) {
      return const <AcceptedTaskModel>[];
    }

    return payload
        .whereType<Map<String, dynamic>>()
        .map(AcceptedTaskModel.fromJson)
        .toList();
  }

  Future<void> fetchInProgressTasks(String workerId) async {
    final url =
        'https://srishticampus.tech/bloodconnect/viavita_api/worker_inprogress_tasks.php?worker_id=$workerId';

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(url));
      debugPrint('In progress tasks response: ${response.body}');

      if (response.statusCode == 200) {
        final decoded = json.decode(response.body);
        final data = decoded is Map<String, dynamic>
            ? decoded
            : (decoded is Map ? Map<String, dynamic>.from(decoded) : <String, dynamic>{});

        final bool successFlag = data['success'] == true || data['status'] == 'success';
        final payload = data['tasks'] ?? data['data'] ?? data['result'] ?? <dynamic>[];

        if (successFlag || payload is List) {
          _tasks = _parseTasks(payload);
          _errorMessage = _tasks.isEmpty ? (data['message'] ?? 'No tasks in progress') : '';
        } else {
          _tasks = [];
          _errorMessage = data['message'] ?? 'No tasks in progress';
        }
      } else {
        _errorMessage = 'Server error: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Connection error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
