class SignInBody {
  String? phoneNumber;

  SignInBody({this.phoneNumber});

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
    };
  }

  SignInBody.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
  }
}
