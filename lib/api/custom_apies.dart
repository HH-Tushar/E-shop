import 'package:e_shop/api/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


  class CustomAPIes{



    static fetchAllProductDate()async {


      String apiUrl = 'https://fakestoreapi.com/products';
      //List<AllProducts>allProduct=[];
      AllProducts ? allProducts;
      var responseBody;

      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        responseBody = jsonDecode(response.body);
        // for (var item in responseBody) {
        //   allProduct.add(
        //       AllProducts(
        //           id: item['id'],
        //           title: item['title'],
        //           price: item['price'],
        //           description: item['description'],
        //           category: item['category'],
        //           image: item['image'],
        //           rating: Rating(
        //             rate: item['rating']['rate'],
        //             count: item['rating']['count'],
        //
        //           )
        //
        //       ));
        // }
        allProducts=AllProducts.fromJson(responseBody);
        return allProducts;
      }
      else {
        Exception();
      }
    }}