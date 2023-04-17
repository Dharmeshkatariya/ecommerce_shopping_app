import 'package:furniture_shoping/modal/homescreen_modal/category_modal.dart';
import 'package:furniture_shoping/modal/homescreen_modal/peroduct_modal.dart';
import 'package:get/get.dart';

import '../api/rest_client.dart';

class HomeScreenController extends GetxController
    with StateMixin<List<ProductData>> {
  List<CategoryData> categoryList = [];
  List<ProductData> productList = [];
  List<ProductData> filterFinalList = [];
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    _dashboardHomeApi();
  }

  final _restClient = RestClient();

  _dashboardHomeApi() async {
    categoryList.clear();
    productList.clear();
    CategoryData categoryData = CategoryData();
    categoryData.id = 0;
    categoryData.categoryName = 'All';
    categoryData.categoryThumb = '';
    categoryList.add(categoryData);
    try {
      change(productList, status: RxStatus.loading());
      var response = await _restClient.get(
        path: "/${"home"}",
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> dataMap = response.data;
        Map<String, dynamic> umap = dataMap["data"];
        List<dynamic> pList = umap["products"];
        List<dynamic> cList = umap["categories"];

        for (int i = 0; i < pList.length; i++) {
          Map<String, dynamic> userMsp = pList[i];
          ProductData productData = ProductData.fromJson(userMsp);
          productList.add(productData);
        }
        for (int i = 0; i < cList.length; i++) {
          Map<String, dynamic> userMsp = cList[i];
          CategoryData categoryData = CategoryData.fromJson(userMsp);
          categoryList.add(categoryData);
        }
        change(productList,
            status:
                productList.isEmpty ? RxStatus.empty() : RxStatus.success());
      }
    } catch (e) {
      change(productList, status: RxStatus.error());

      print(e);
      Get.snackbar("field", "$e");
    }
    update();
  }

  filterData(int index) {
    filterFinalList.clear();
    selectedIndex.value = index;
    CategoryData categoryData = categoryList[index];
    List<ProductData> finalList = [];
    finalList = productList
        .where((element) => element.categoryName == categoryData.categoryName)
        .toList();
    filterFinalList.addAll(finalList);
    change(filterFinalList, status: RxStatus.success());
  }
}
