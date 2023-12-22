import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/all_product_model.dart';

class CustomAPIes {
  static fetchAllProductDate() async {
    String apiUrl = 'https://fakestoreapi.com/products';
    List<Products> allProduct = [];

    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body.toString());
      for (var item in responseBody) {
       
        allProduct.add(Products.fromJson((item))
            

            );
      }
      return allProduct;
    } else {
      Exception();
    }
  }
}
