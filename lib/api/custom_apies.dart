import 'package:e_shop/api/models/all_product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


  class CustomAPIes{



    static fetchAllProductDate()async {


      String apiUrl = 'https://fakestoreapi.com/products';
      List<Products>allProduct=[];

      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body.toString());
        for (var item in responseBody) {
          // print("printing from custom api for loop");
          // print(item);
          allProduct.add(
              Products.fromJson((item))
                  // id: item['id'],
                  // title: item['title'],
                  // price: item['price'],
                  // description: item['description'],
                  // category: item['category'],
                  // image: item['image'],
                  // rating: Rating(
                  //   rate: item['rating']['rate'],
                  //   count: item['rating']['count'],
                  //
                  // )

              );
        }
        return allProduct;
      }
      else {
        Exception();
      }
    }}