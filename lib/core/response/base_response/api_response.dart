// ignore_for_file: unnecessary_this

class ApiBaseResponse {
  late bool success;
  String? error;

  ApiBaseResponse(this.success, {this.error});

  ApiBaseResponse.fromJson(json) {
    this.success = json["success"];
    this.error = json["message"];
  }

  toJson() {
    return {
      'success': this.success,
      'message': this.error,
    };
  }
}
