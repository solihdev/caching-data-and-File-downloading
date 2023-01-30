part of 'product_bloc.dart';

abstract class ProductState {}

class ProductsInitial extends ProductState {}

class GetProductsInProgress extends ProductState {}

class GetProductsInSuccess extends ProductState {
  List products;

  GetProductsInSuccess({required this.products});
}

class GetProductsInFailure extends ProductState {
  String error;

  GetProductsInFailure({required this.error});
}
