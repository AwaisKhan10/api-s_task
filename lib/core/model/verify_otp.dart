class VerifyOtp {
  final int otp;
  String? uid;

  VerifyOtp({required this.otp, required this.uid});

  Map<String, dynamic> toJson() => {
        'otp': otp,
        'uid': uid,
      };
}
