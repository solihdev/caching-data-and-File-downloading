import 'package:cachingdata_and_filedownloading/bloc/product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProductsBloc>().add(GetProductsEvent());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product page Api"),
      ),
      body: Center(
        child: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is GetProductsInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is GetProductsInFailure) {
              return Text(state.error);
            }
            if (state is GetProductsInSuccess) {
              return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  itemBuilder: (context, index) => Padding(
                        padding:
                            const EdgeInsets.only(right: 10, left: 10, top: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 90,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: SizedBox(
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.products[index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(state.products[index].price.toString()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
