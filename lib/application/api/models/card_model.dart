import 'all_product_model.dart';

class MyCartModel {
  Products products;
  int? totalItem;
  MyCartModel({required this.products, this.totalItem});
}

class OrderProducts {
  int? id;
  String? title;
  double? price;
  String? category;
  int? quantity;

  OrderProducts({
    this.id,
    this.title,
    this.price,
    this.category,
    this.quantity,
  });
}
