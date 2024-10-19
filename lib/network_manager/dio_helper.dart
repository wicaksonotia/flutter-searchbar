import 'dart:async';
import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
import 'package:searchbar/models/carousel_model.dart';
import 'package:searchbar/models/product_model.dart';
// import 'package:http/http.dart' as http;

class RemoteDataSource {
  final dio = Dio(BaseOptions(baseUrl: 'http://103.184.181.9/api'));

  Future<List<CarouselModel>?> getSliderPromo() async {
    try {
      final response = await dio.get('/slider');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((e) => CarouselModel.fromJson(e)).toList();
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<ProductModel>?> getProduct() async {
    try {
      final response = await dio.get('/product');
      if (response.statusCode == 200) {
        List<dynamic> jsonData = response.data;
        return jsonData.map((e) => ProductModel.fromJson(e)).toList();
        // if (kDebugMode) {
        //   print(jsonData);
        // }
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // String url = 'http://103.184.181.9/api/product';
  // Future<List<CarouselModel>> getSliderPromo() async {
  //   final response = await http.get(Uri.parse(url));

  //   if (response.statusCode == 200) {
  //     final List result = jsonDecode(response.body)['data'];
  //     return result.map((e) => CarouselModel.fromJson(e)).toList();
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
}
