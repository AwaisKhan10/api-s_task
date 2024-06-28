class AuthResponse {
  final bool success;
  final String? error;

  AuthResponse(
    this.success, {
    this.error,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      json['success'] as bool,
      error: json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'error': error,
      };
}
