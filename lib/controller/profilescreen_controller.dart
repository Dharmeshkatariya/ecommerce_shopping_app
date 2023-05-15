import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreenController extends GetxController {
  RxString imagePath = "".obs;
  late String email;
  late String username;

  getImageGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imagePath.value = image!.path;
    update();
  }

  getUserData() async {
    var shareP = await SharedPreferences.getInstance();
    email = shareP.getString("email") ?? "";
    username = shareP.getString("username") ?? "";
  }

  @override
  void onInit() {
    getUserData();
    // TODO: implement onInit
    super.onInit();
  }
}
