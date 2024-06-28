import 'package:get/get.dart';
import 'package:pickmed/core/enums/view_state.dart';
import 'package:pickmed/core/others/base_view_model.dart';
import 'package:pickmed/core/services/auth_serives.dart';
import 'package:pickmed/locator.dart';

import '../auth/sign_in/sign_in_screen.dart';

class HomeViewModel extends BaseViewModel {
  final authServices = locator<AuthServices>();
  bool isSelect = false;

  void onClick() {
    isSelect = true;
    notifyListeners();
  }

  void resetSelection() {
    isSelect = false;
    notifyListeners();
  }

  logoutUser() {
    setState(ViewState.busy);
    authServices.logout().then((value) {
      setState(ViewState.idle);
      Get.offAll(() => SignInScreen()); // Navigate to sign-in screen
    });
  }
}
