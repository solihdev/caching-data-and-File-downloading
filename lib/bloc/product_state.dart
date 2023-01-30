part of 'product_bloc.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class GetProductsInProgress extends ProductsState {}

class GetProductsInSuccess extends ProductsState {
  List<ProductModel> products;

  GetProductsInSuccess({required this.products});
}

class GetProductsInFailure extends ProductsState {
  String error;

  GetProductsInFailure({required this.error});
}
