import 'dart:async';
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class LiveStreamController extends GetxController {
  CameraController? cameraController;
  RxList<CameraDescription> cameras = <CameraDescription>[].obs;
  RxBool isCameraInitialized = false.obs;
  RxInt selectedCameraIndex = 0.obs;

  // Stream Info
  RxString streamTime = "00:00:00".obs;
  Timer? _streamTimer;
  int _seconds = 0;

  // Bidding/Sales State
  RxInt currentBid = 7.obs;
  RxInt bidCount = 4.obs;
  RxBool isRunNextClicked = false.obs;
  RxBool isSuddenDeath = false.obs;
  RxString selectedCounterTime = "5s".obs;

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
    _startStreamTimer();
  }

  Future<void> _initializeCamera() async {
    cameras.value = await availableCameras();
    if (cameras.isNotEmpty) {
      // Find the front camera index
      int frontCameraIndex = cameras.indexWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      // If front camera exists, use it; otherwise use the first available
      if (frontCameraIndex != -1) {
        selectedCameraIndex.value = frontCameraIndex;
      } else {
        selectedCameraIndex.value = 0;
      }

      _setupCamera(cameras[selectedCameraIndex.value]);
    }
  }

  Future<void> _setupCamera(CameraDescription cameraDescription) async {
    isCameraInitialized.value = false;
    if (cameraController != null) {
      await cameraController!.dispose();
    }
    cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.high,
      enableAudio: true,
    );

    try {
      await cameraController!.initialize();
      isCameraInitialized.value = true;
    } catch (e) {
      print("Camera Error: $e");
    }
  }

  void switchCamera() {
    if (cameras.length < 2) return;
    selectedCameraIndex.value = (selectedCameraIndex.value + 1) % cameras.length;
    _setupCamera(cameras[selectedCameraIndex.value]);
  }

  void _startStreamTimer() {
    _streamTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds++;
      streamTime.value = _formatDuration(Duration(seconds: _seconds));
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void onClose() {
    cameraController?.dispose();
    _streamTimer?.cancel();
    super.onClose();
  }
}
