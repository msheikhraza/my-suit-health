

import 'package:get/get.dart';
import 'package:razasheikhtest/modules/products/products_view_model/products_view_model.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductViewModel>(
          () => ProductViewModel(),
    );
  }
}
