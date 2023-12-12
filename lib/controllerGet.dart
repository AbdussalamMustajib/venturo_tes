import 'package:get/get.dart';

class SecureTextController extends GetxController {
  var _secureText = false.obs;

  void setSecureText() {
    _secureText.value = !_secureText.value;
  }
}
