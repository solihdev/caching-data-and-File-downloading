import 'package:cachingdata_and_filedownloading/data/api_service/api_service.dart';
import 'package:cachingdata_and_filedownloading/data/models/product_model.dart';
import 'package:cachingdata_and_filedownloading/data/models/response_model.dart';
import 'package:cachingdata_and_filedownloading/data/repositories/local_db.dart';
import 'package:cachingdata_and_filedownloading/utils/assistants/get_it/get_it.dart';

class ProductRepo {
  Future<MyResponse> getAllProducts() async =>
      await getIt<ApiService>().getAllProducts();

  addAllProduct(List products) async {
    for (int i = 0; i < products.length; i++) {
      await getIt<LocalDatabase>().addProduct(products[i]);
    }
    print("Qo'shildi");
  }

  deleteAllData() async {
    await getIt<LocalDatabase>().deleteAllData();
    print("Delete bo'ldi");
  }

  getAllData() async {
    print("Keldi!!!");
    List products = await getIt<LocalDatabase>().getAllProduct();
    return products.map((e) => ProductModel.fromJson(e)).toList();
  }
}
