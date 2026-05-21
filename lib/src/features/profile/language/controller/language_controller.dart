import 'package:get/get.dart';

class LanguageController extends GetxController {
  var selectedLanguage = 'English'.obs;

  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en'},
    {'name': 'Spanish', 'code': 'es'},
    {'name': 'French', 'code': 'fr'},
    {'name': 'German', 'code': 'de'},
    {'name': 'Chinese', 'code': 'zh'},
    {'name': 'Arabic', 'code': 'ar'},
    {'name': 'Bengali', 'code': 'bn'},
  ];

  void selectLanguage(String language) {
    selectedLanguage.value = language;
  }
}
