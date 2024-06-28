// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickmed/core/constants/app_end_points.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/verify_otp.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/response/auth_response.dart';
import 'package:pickmed/core/response/verify_otp_response.dart';
import 'package:pickmed/core/services/api_services.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/core/services/local_storage.dart';
import 'package:pickmed/locator.dart';
import 'package:pickmed/ui/screens/home/home_screen.dart';

class OtpVerifyViewModel extends BaseViewModel {
  final TextEditingController OTPController = TextEditingController();
  bool isotp = false;
  late AuthResponse authResponse;
  final authServices = locator<AuthServices>();
  final localStorageService = locator<LocalStorageService>();

  OtpVerifyViewModel() {
    OTPController.addListener(_OtpLength);
  }

  void _OtpLength() {
    if (OTPController.text.length > 5) {
      if (!isotp) {
        isotp = true;
        notifyListeners();
      }
    } else {
      if (isotp) {
        isotp = false;
        notifyListeners();
      }
    }
  }

  VerifyOtpPhoneNumber(int value) async {
    setState(ViewState.busy); // Set state to busy while signing in

    VerifyOtp verifyOtp =
        VerifyOtp(otp: value, uid: localStorageService.userId);
    Map<String, dynamic> requestBody = verifyOtp.toJson();

    ApiServices apiServices = ApiServices();
    String url = EndPoints.baseUrl + EndPoints.verifyOtp;

    try {
      print("Sending request to $url with body: $requestBody");
      OtpVerificationResponse response =
          await apiServices.postRequest2(url: url, data: requestBody);
      print("Otp Response is: ${response.success}");

      if (response.success) {
        String? token = response.data['token'];
        if (token != null) {
          localStorageService.token = token; // Store user ID locally
          Get.offAll(() => HomeScreen());
          print("Sign-in successful, token ID: $token");
        } else {
          Get.snackbar("Error:", "Token not found.");
          print("Token not found in response data.");
        }
      } else {
        Get.snackbar("Error:", "Sign-in failed: ${response.error}");
        print("Sign-in failed: ${response.error}");
      }
    } catch (e) {
      print("Error during sign-in: $e");
      Get.snackbar("Error:", "Failed to sign in.");
    } finally {
      setState(ViewState.idle);
    }
  }

  @override
  void dispose() {
    OTPController.removeListener(_OtpLength);
    OTPController.dispose();
    super.dispose();
  }
}
