import 'package:get/get_connect.dart';
import 'package:kedai_kopi/app/data/coffe_model.dart';

class HomeProvider extends GetConnect {
  Future<List<CoffeModel>> getCoffeList() async {
    final response = await get("https://api.sampleapis.com/coffee/hot");

    if (response.hasError) {
      return Future.error(response.statusText!);
    } else {
      final List listCoffe = response.body;
      return listCoffe.map((e) => CoffeModel.fromJson(e)).toList();
    }
  }
}
