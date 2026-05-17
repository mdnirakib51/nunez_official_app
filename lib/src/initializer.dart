import 'package:get/get.dart';

import 'core_functionality/constants/app_config.dart';
import 'core_functionality/network/http_client/request_handler.dart';
import 'core_functionality/storage/local_storage.dart';
import 'core_functionality/storage/storage_controller.dart';
import 'global/utils/device_info.dart';

Future<void> init() async {
  LocalStorage localStorage = LocalStorage();
  await localStorage.initLocalStorage();
  Get.put<LocalStorage>(localStorage, permanent: true);

  LocalStorageService storageService = await LocalStorageService.getInstance();
  Get.put<LocalStorageService>(storageService, permanent: true);

  RequestHandler requestHandler = await RequestHandler.create();
  Get.put<RequestHandler>(requestHandler, permanent: true);

  AppUrlExtension.initializeUrl(defaultUrlLink: ApiBaseUrl.isDev);

  // Device Info
  await GetDeviceInfo.getDeviceInfo();
}