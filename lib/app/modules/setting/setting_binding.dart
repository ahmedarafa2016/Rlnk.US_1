import 'package:get/get.dart';
import 'package:rlnk_1/app/modules/setting/setting_controller.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SettingController>(
      SettingController(),
    );
  }
}
