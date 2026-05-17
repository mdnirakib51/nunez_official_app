import 'package:get/get.dart';
import '../../../global/constants/app_strings.dart';

class OnBoardingController extends GetxController {
  var selectedLanguage = AppStrings.english.obs;

  bool get isSpanish => selectedLanguage.value == AppStrings.spanish;

  void updateLanguage(String language) {
    selectedLanguage.value = language;
  }
}
