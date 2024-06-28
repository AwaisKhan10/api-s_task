// ignore_for_file: unnecessary_this, avoid_print

class RequestResponse {
  late bool success;
  String? error;
  dynamic data;

  RequestResponse(this.success, {this.error, this.data});

  RequestResponse.fromJson(Map<String, dynamic> json) {
    try {
      // Check if the response indicates success based on your criteria
      this.success = json['_id'] != null && json['message'] != null;

      // Set data and error based on JSON response
      if (this.success) {
        this.data = json; // Assign the entire JSON response as data
        this.error = null; // No error if success
      } else {
        this.data = null; // No data if not successful
        this.error = json['message'] ??
            "Unknown error"; // Set error message if available
      }
    } catch (e) {
      print("Error in RequestResponse.fromJson: $e");
      success = false;
      error = "Failed to parse response";
      data = null;
    }
  }
}
