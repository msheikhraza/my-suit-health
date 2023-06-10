import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razasheikhtest/appWidgets/snack_bar_handler.dart';
import 'package:razasheikhtest/modules/login/model/login_model.dart';
import 'package:razasheikhtest/modules/login/repository/login_repository_impl.dart';
import 'package:razasheikhtest/routes/app_routes.dart';

class LoginViewModel {
  LoginRepositoryImpl loginRepositoryImpl = LoginRepositoryImpl();
  LoginModel loginModel = LoginModel();

  loginUser(String email, String password, var context) async {
    var body = {
      'username': email,
      'password': password,
    };
    try {
      var response = await loginRepositoryImpl.login(body);
      if (response.statusCode == 200 ) {
        loginModel = LoginModel.fromJson(jsonDecode(response.body));
        SnackBarHandler.successSingle(context, 'Login Successfully');
        Get.offAllNamed(Routes.homeScreen);
      } else {
        Navigator.of(context).pop();
        FocusScope.of(context).requestFocus(FocusNode());
        SnackBarHandler.error(context, 'Error', response.body);
      }
    } catch (error) {
      if (error is TimeoutException) {
        Navigator.of(context).pop();
        SnackBarHandler.error(context, 'Error', 'Server Timeout');
      }
      if (error is SocketException) {
        Navigator.of(context).pop();
        SnackBarHandler.error(context, 'Error', 'No Internet Connection');
      }
    }
  }

}