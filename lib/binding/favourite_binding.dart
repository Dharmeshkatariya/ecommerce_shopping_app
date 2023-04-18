import 'package:furniture_shoping/controller/favoutire_controller.dart';
import 'package:get/get.dart';

class FavouriteBinding extends Bindings{
  @override
  void dependencies() {
 Get.put(FavouriteController());
    // TODO: implement dependencies
  }

}