// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pickmed/core/constants/app_end_points.dart';
import 'package:pickmed/core/model/card.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/response/base_response/request_response.dart';
import 'package:pickmed/core/services/api_services.dart';

class AddBuisnessViewModel extends BaseViewModel {
  // Controllers for Page
  final PageController pageController = PageController(initialPage: 0);

  // Controllers for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController fieldController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController buisnesswebsiteController = TextEditingController();

  // Variables to hold the state
  bool isSwitched = false;
  Color primaryColor = Colors.blue.withOpacity(0.20);
  String selected = 'Organization Type';

  // List of organizations (dummy data)
  List<String> organization = [
    'Organization Type',
    'App Development',
    'Marketing',
    'Web Development',
  ];

  isSwitchedClick(val) {
    isSwitched = val;
    notifyListeners();
  }

  // Method to check if all fields are filled
  bool _areAllFieldsFilled() {
    return nameController.text.isNotEmpty &&
        fieldController.text.isNotEmpty &&
        bioController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        buisnesswebsiteController.text.isNotEmpty;
  }

  // Method to update primary color based on field states
  void updatePrimaryColor() {
    if (_areAllFieldsFilled()) {
      primaryColor = Colors.blue;
    } else {
      primaryColor = Colors.blue.withOpacity(0.30);
    }
    notifyListeners();
  }

  // Logic to navigate to the next page
  void nextPage(nextPageIndex) {
    if (pageController.hasClients) {
      pageController.animateToPage(
        nextPageIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }

    // Collect data from all fields and prepare to send to the server
    // CardData cardData = CardData(
    //   businessName: nameController.text,
    //   businessField: fieldController.text,
    //   businessBio: bioController.text,
    //   businessEmail: emailController.text,
    //   businessPhone: phoneController.text,
    //   website: buisnesswebsiteController.text,
    //   organization: selected,
    //   isPublic: isSwitched,
    // );

    // sendPostRequest(cardData);
  }

  Future<void> sendPostRequest(CardData cardData) async {
    ApiServices apiServices = ApiServices();
    String url = EndPoints.baseUrl + EndPoints.cardPost;

    try {
      print("Sending POST request to $url with data: ${cardData.toJson()}");
      RequestResponse response = await apiServices.postRequest(
        url: url,
        data: cardData.toJson(),
      );

      if (response.success) {
        Get.snackbar("Success", "Business data saved successfully.");
      } else {
        Get.snackbar(
            "Error", "Failed to save business data: ${response.error}");
      }
    } catch (e) {
      print("Error during POST request: $e");
      Get.snackbar("Error", "Failed to save business data.");
    }
  }
}
