import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kedai_kopi/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final passwordController = TextEditingController();
  final isPasswordShow = false.obs;

  void validatePassword() {
    if (passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Masukan Pin Anda",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } else if (!passwordController.text.isNum) {
      Get.snackbar(
        "Error",
        "Pin Harus Angka",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    } else if (passwordController.text == "2022") {
      Get.toNamed(Routes.HOME);
    } else {
      Get.snackbar(
        "Error",
        "Pin Anda Salah",
        colorText: Colors.white,
        backgroundColor: Colors.red,
      );
    }
  }
}
