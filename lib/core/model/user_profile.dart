// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class UserProfile {
  String? id;
  String? phoneNumber;
  UserProfile({
    this.id,
    this.phoneNumber,
  });

  UserProfile.fromJson(Map<String, dynamic> json) {
    try {
      this.phoneNumber = json["phoneno"];
      this.id = json["_id"];
    } catch (e) {
      debugPrint("profile.FromJsonError => $e");
    }
  }

  toJson() {
    return {
      "phoneno": phoneNumber,
    };
  }
}
