import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../routes/nameroutes.dart';

class CheckOutScreenController extends GetxController {
  late RxDouble total;

  RxDouble totalPrice = 0.0.obs;

  @override
  void onInit() {
    getData();
    getTotalPrice();
    // TODO: implement onInit
    super.onInit();
  }

  getData() {
    if (Get.arguments != null) {
      total = Get.arguments["total"];
      print(total);
    }
  }

  getTotalPrice() {
    totalPrice.value = total.value + 5;
    print(totalPrice);
  }

  sendlaunchWhatsAppUri() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+917990941293',
      text: "your  order order name totalprice  $totalPrice,",
    );
    await launch(link.asUri().toString());
    Get.toNamed(NameRoutes.succeessOrderScreen);
  }




}
