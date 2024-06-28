// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:pickmed/core/model/verify_otp.dart';
import 'package:pickmed/core/response/auth_response.dart';
import 'package:pickmed/core/services/api_services.dart';
import 'package:pickmed/core/services/data_base_services.dart';
import 'package:pickmed/core/services/local_storage.dart';
import 'package:pickmed/locator.dart';

class AuthServices {
  late ApiServices _apiServices;
  late bool isLogin;
  final DatabaseService _dbService = DatabaseService();
  final LocalStorageService _localStorageService =
      locator<LocalStorageService>();

  AuthServices() {
    _apiServices = ApiServices();
    _localStorageService.init();
  }

  doSetup() async {
    isLogin = _localStorageService.userId != null;
    if (isLogin) {
      debugPrint('User is already logged-in');
    } else {
      debugPrint('User is not logged-in');
    }
  }

  Future<void> logout() async {
    // await _localStorageService.clearData();
  }

  // Future<RequestResponse> verifyOTP(String otp, String userId) async {
  //   String url = EndPoints.baseUrl + EndPoints.verifyOtp;
  //   Map<String, dynamic> requestBody = {
  //     'otp': otp,
  //     'userId': userId,
  //   };

  //   return await _apiServices.postRequest(url: url, data: requestBody);
  // }

  ///
  /// Verify Otp
  ///
  verifyOtp(VerifyOtp verifyEmail) async {
    final AuthResponse response = await _dbService.verifOTP(verifyEmail);
    return response;
  }
}
