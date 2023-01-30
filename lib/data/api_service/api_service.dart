import 'package:cachingdata_and_filedownloading/data/api_service/api_client.dart';
import 'package:cachingdata_and_filedownloading/data/models/product_model/product_model.dart';
import 'package:cachingdata_and_filedownloading/data/models/response_model/response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getAllProducts() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      debugPrint("Kaldi");
      Response response = await dio.get("${dio.options.baseUrl}/products");
      if (response.statusCode == 200) {
        myResponse.data = (response.data['data'] as List?)
                ?.map((e) => ProductModel.fromJson(e))
                .toList() ??
            [];
      }
    } catch (e) {
      myResponse.error = e.toString();
    }
    return myResponse;
  }
}
