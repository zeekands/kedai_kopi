import 'package:get/get.dart';
import 'package:kedai_kopi/app/data/coffe_model.dart';

import '../providers/home_provider.dart';

class HomeController extends GetxController with StateMixin {
  final listCoffe = <CoffeModel>[].obs;
  @override
  void onInit() async {
    super.onInit();
    await getCoffe();
  }

  @override
  void onClose() {}

  Future<void> getCoffe() async {
    change(null, status: RxStatus.loading());
    try {
      final coffe = await HomeProvider().getCoffeList();
      listCoffe.value = coffe;
      print(listCoffe.length);
      change(coffe, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
