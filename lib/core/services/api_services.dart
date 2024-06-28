// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pickmed/core/response/base_response/request_response.dart';
import 'package:pickmed/core/response/verify_otp_response.dart';

class ApiServices {
  Future<Dio> launchDio() async {
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) => status != null && status < 500;
    return dio;
  }

  ///
  /// post request
  ///

  Future<RequestResponse> postRequest(
      {required String url, dynamic data}) async {
    Dio dio = await launchDio();

    try {
      final response = await dio.post(url, data: data);
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return RequestResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return RequestResponse(false, error: 'Server Error');
      } else {
        return RequestResponse(false, error: 'Unexpected Error');
      }
    } catch (e) {
      print('Error in postRequest: $e');
      return RequestResponse(false, error: 'Network Error');
    }
  }

  ///
  /// OtpVerificationResponse post request 1
  ///

  Future<OtpVerificationResponse> postRequest2(
      {required String url, dynamic data}) async {
    Dio dio = await launchDio();

    try {
      final response = await dio.post(url, data: data);
      print('Response status: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return OtpVerificationResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return OtpVerificationResponse(false, error: 'Server Error');
      } else {
        return OtpVerificationResponse(false, error: 'Unexpected Error');
      }
    } catch (e) {
      print('Error in postRequest: $e');
      return OtpVerificationResponse(false, error: 'Network Error');
    }
  }

  Future<RequestResponse> getRequest({required String url, data}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.get(url, queryParameters: data);
      return _handleResponse(response);
    } catch (e) {
      debugPrint('Get request error: $e');
      return RequestResponse(false,
          error: "An unexpected error occurred, please try again.");
    }
  }

  Future<RequestResponse> deleteRequest({required String url, params}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.delete(url, queryParameters: params);
      return _handleResponse(response);
    } catch (e) {
      debugPrint('Delete request error: $e');
      return RequestResponse(false,
          error: "An unexpected error occurred, please try again.");
    }
  }

  Future<RequestResponse> putRequest({required String url, data}) async {
    Dio dio = await launchDio();
    try {
      final response = await dio.put(url, data: data);
      return _handleResponse(response);
    } catch (e) {
      debugPrint('Put request error: $e');
      return RequestResponse(false,
          error: "An unexpected error occurred, please try again.");
    }
  }

  RequestResponse _handleResponse(Response response) {
    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');
    if (response.statusCode == 201) {
      return RequestResponse.fromJson(response.data);
    } else if (response.statusCode == 500) {
      return RequestResponse(false, error: 'Server Error');
    } else {
      return RequestResponse(false, error: 'Network Error');
    }
  }
}
