// import 'package:flutter/material.dart';
// import 'package:workers_app/data/models/api_models.dart';
// import 'package:workers_app/data/models/services/api_service.dart';

// enum ViewState {idle,loading,success,error}

// class postProvider extends ChangeNotifier{
//   ApiService api = ApiService();


//   List<Tasks> task = []; //for objects that has been changed from json
//   ViewState state = ViewState.idle;
//   String errorMessage = '';


//   Future<void> loadposts() async{
//       state = ViewState.loading;

//     try {
//       task  = await api.fetchposts();
//       state = ViewState.success;
//     } catch (e) {
//       errorMessage = e.toString();
//       state = ViewState.error;
//     }
//     notifyListeners();
//   }
// }
  