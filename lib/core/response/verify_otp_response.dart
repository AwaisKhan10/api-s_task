// ignore_for_file: unnecessary_this, avoid_print
class OtpVerificationResponse {
  late bool success;
  String? error;
  dynamic data;
  String? token; // New field to store token if available

  OtpVerificationResponse(this.success, {this.error, this.data, this.token});

  OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
    try {
      // Example: Check if the response indicates success based on specific conditions
      this.success = json
          .containsKey('token'); // Example condition based on 'token' presence

      if (this.success) {
        this.token = json['token']; // Extract token from response if success
        this.data = json; // Assign the entire JSON response as data
        this.error = null; // No error if success
      } else {
        this.token = null; // No token if not successful
        this.data = null; // No data if not successful
        this.error = json['message'] ??
            "Unknown error"; // Set error message if available
      }
    } catch (e) {
      print("Error in RequestResponse.fromJson: $e");
      success = false;
      error = "Failed to parse response";
      data = null;
      token = null;
    }
  }
}
