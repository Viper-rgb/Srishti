// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:workers_app/data/models/api_models.dart';

// class ApiService {
//   static const _baseurl = 'https://srishticampus.tech/bloodconnect/viavita_api/view_new_tasks.php';
//   Future<List<Tasks>> fetchposts () async {
//     final response =await http.get(Uri.parse('$_baseurl/posts'));
//     if (response.statusCode == 200){
//       final List data = jsonDecode(response.body);
//       return data.map((json)=> Tasks.fromJson(json)).toList();
//     }else {
//       throw Exception('Failed to load posts');
//     }
//   }

// } 