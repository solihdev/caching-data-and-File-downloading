import 'package:cachingdata_and_filedownloading/data/models/product_model/product_model.dart';
import 'package:cachingdata_and_filedownloading/data/models/response_model/response_model.dart';
import 'package:cachingdata_and_filedownloading/data/repositories/product_repo.dart';
import 'package:cachingdata_and_filedownloading/utils/assistants/get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductsBloc extends Bloc<GetProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsInitial()) {
    on<GetProductsEvent>(getProduct);
  }

  getProduct(event, emit) async {
    emit(GetProductsInProgress());
    MyResponse myResponse = await getIt<ProductRepo>().getAllProducts();
    if (myResponse.error.isNotEmpty) {
      emit(GetProductsInFailure(error: myResponse.error));
      if (myResponse.error ==
          "No internet connection detected, please try again.") {
        emit(GetProductsInProgress());
        myResponse.data = await getIt<ProductRepo>().getAllData();
        emit(GetProductsInSuccess(products: myResponse.data));
      }
    } else {
      emit(GetProductsInSuccess(products: myResponse.data));
      await getIt<ProductRepo>().deleteAllData();
      await getIt<ProductRepo>().addAllProduct(myResponse.data);
    }
  }
}
