import 'package:pickmed/core/constants/app_end_points.dart';
import 'package:pickmed/core/model/verify_otp.dart';
import 'package:pickmed/core/response/auth_response.dart';
import 'package:pickmed/core/response/base_response/request_response.dart';
import 'package:pickmed/core/services/api_services.dart';

class DatabaseService {
  final ApiServices _apiServices = ApiServices();
  Future<AuthResponse> verifOTP(VerifyOtp verifyEmail) async {
    final RequestResponse response = await _apiServices.postRequest(
        url: '${EndPoints.baseUrl}${EndPoints.verifyOtp}',
        data: verifyEmail.toJson());

    return AuthResponse.fromJson(response.data);
  }
  // Future<AuthResponse> loginWithPhoneNumber(SignInBody body) async {
  //   final RequestResponse response = await _apiServices.postRequest(
  //     url: '${EndPoints.baseUrl}${EndPoints.signIn}',
  //     data: body.toJson(),
  //   );

  //   if (response.success) {

  //       String? userId =
  //           response.data['_id']; // Assuming '_id' is the user ID key
  //       if (userId != null) {
  //         _localStorageService.userId = userId; // Store user ID locally

  //         print("@DatabaseServices  user ID id is = : : $userId");
  //       }else{

  //         print("@ExceptionDatabaseServices user ID id is = : $userId");
  //       }

  //   }
  //   return AuthResponse.fromJson(response.data);
  // }
}
