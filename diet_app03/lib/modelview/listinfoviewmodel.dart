import 'package:diet_app/modelview/userinfo_view_model.dart';
import 'package:diet_app/service/dblistservice.dart';
import 'package:flutter/material.dart';

class ListInfoViewModel extends ChangeNotifier {
  List<userInfoViewModel> userInfo = <userInfoViewModel>[];

   Future<void> queryUserinfo() async {
    final results = await DBListService().retrieveUsers();
    userInfo = results.map((item) => userInfoViewModel(diary: item)).toList();
    notifyListeners();

  }



}