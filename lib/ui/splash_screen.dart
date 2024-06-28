// ignore_for_file: unrelated_type_equality_checks

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/ui/custom_widgets/dialogs/network_error.dart';
import 'package:pickmed/ui/screens/auth/sign_in/sign_in_screen.dart';
import 'package:pickmed/ui/screens/home/home_screen.dart';
import '../../core/services/local_storage.dart';
import '../../locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthServices>();
  final _localStorateService = locator<LocalStorageService>();

  _initialSetup() async {
    await Future.delayed(const Duration(seconds: 2));
    await _localStorateService.init();
    await _authService.doSetup();

    ///
    /// If not connected to internet, show an alert dialog
    /// to activate the network connection.
    ///
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.dialog(const NetworkErrorDialog());
      return;
    }
    // Get.off(() => SignInScreen());

    ////
    ///checking if the user is login or not
    ///
    debugPrint('Login State: ${_authService.isLogin}');
    if (_authService.isLogin) {
      Get.off(() => HomeScreen());
    } else {
      Get.off(() => SignInScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    _initialSetup();
  }

  @override
  Widget build(BuildContext context) {
    ///
    /// Splash Screen UI goes here.
    ///
    return Scaffold(
      body: Center(
          child: Text(
        'Task Api"s and UI  Loading ...',
        style: TextStyle(fontSize: 24.sp),
      )),
    );
  }
}
