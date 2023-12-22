class OrderModel {
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  List<Products>? products;

  OrderModel(
      {this.customerName,
      this.customerPhone,
      this.customerAddress,
      this.products});

  OrderModel.fromJson(Map<String, dynamic> json) {
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    customerAddress = json['customerAddress'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customerName'] = this.customerName;
    data['customerPhone'] = this.customerPhone;
    data['customerAddress'] = this.customerAddress;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? name;
  String? unitPrice;
  String? quantity;

  Products({this.name, this.unitPrice, this.quantity});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    unitPrice = json['unitPrice'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['unitPrice'] = this.unitPrice;
    data['quantity'] = this.quantity;
    return data;
  }
}