import 'package:get/get.dart';
import 'package:shater/presentation/screens/city/controller/city_controller.dart';

class CityBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CityController());
  }

}