// ignore_for_file: avoid_print, duplicate_ignore

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickmed/core/constants/app_end_points.dart';
import 'package:pickmed/core/constants/colors.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/model/login_body.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:country_picker/country_picker.dart' as cp;
import 'package:pickmed/core/response/auth_response.dart';
import 'package:pickmed/core/response/base_response/request_response.dart';
import 'package:pickmed/core/services/api_services.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/core/services/local_storage.dart';
import 'package:pickmed/locator.dart';
import 'package:pickmed/ui/screens/auth/otp_verify/otp_screen.dart';

class SignInViewModel extends BaseViewModel {
  final TextEditingController phoneController = TextEditingController();
  cp.Country? country;
  bool isPhoneNumberLongEnough = false;
  bool isotp = false;
  late AuthResponse authResponse;
  final authServices = locator<AuthServices>();
  final localStorageService = locator<LocalStorageService>();
  SignInBody signInBody = SignInBody();

  SignInViewModel() {
    phoneController.addListener(_checkPhoneNumberLength);
  }

  void _checkPhoneNumberLength() {
    if (phoneController.text.length > 8) {
      if (!isPhoneNumberLongEnough) {
        isPhoneNumberLongEnough = true;
        notifyListeners();
      }
    } else {
      if (isPhoneNumberLongEnough) {
        isPhoneNumberLongEnough = false;
        notifyListeners();
      }
    }
  }

  void showPicker(BuildContext context) {
    showCountryPicker(
      countryListTheme: const CountryListThemeData(backgroundColor: whiteColor),
      context: context,
      favorite: ['PK', 'US', 'IN'],
      exclude: ['CN'],
      onSelect: (cp.Country country) {
        this.country = country;
        notifyListeners();
      },
    );
  }

  void signInWithPhoneNumber(String phoneNumber) async {
    setState(ViewState.busy); // Set state to busy while signing in

    signInBody = SignInBody(phoneNumber: phoneNumber);
    Map<String, dynamic> requestBody = signInBody.toJson();

    ApiServices apiServices = ApiServices();
    String url = EndPoints.baseUrl + EndPoints.signIn;

    try {
      RequestResponse response =
          await apiServices.postRequest(url: url, data: requestBody);

      if (response.success) {
        String? userId =
            response.data['_id']; // Assuming '_id' is the user ID key
        if (userId != null) {
          localStorageService.userId = userId; // Store user ID locally
          Get.to(() => OTPScreen());
          print("Sign-in successful, user ID: $userId");
        } else {
          Get.snackbar("Error:", "User ID not found.");
          // ignore: avoid_print
          print("User ID not found in response data.");
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
    phoneController.removeListener(_checkPhoneNumberLength);
    phoneController.dispose();
    super.dispose();
  }
}
