import 'package:e_shop/api/models/all_product_model.dart';

class MyCartModel{
  Products products;
  int ? totalItem;
  MyCartModel({required this.products,this.totalItem});
}