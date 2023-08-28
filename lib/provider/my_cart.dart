import 'package:flutter/foundation.dart';
import '../api/models/all_product_model.dart';
import '../api/models/card_model.dart';

class MyCart extends ChangeNotifier {
  late List<MyCartModel> _myCart = [];
  double _totalProductPrice = 0;
  double _totalPrice = 0;
  double _totalVat = 0;

  double get getTotalProductPrice {
    return _totalProductPrice;
  }

  double get getTotalPrice {
    return _totalPrice;
  }

  double get getTotalVat {
    return _totalVat;
  }

  List<MyCartModel> get getMyCartData {
    return _myCart;
  }

  addItemsInCart(Products curProduct) async {
    _myCart.add(MyCartModel(products: curProduct, totalItem: 1));
    // _allproducts=await CustomAPIes.fetchAllProductDate();
    _totalProductPrice =
        _totalProductPrice + (double.parse(curProduct.price.toString()) * 1);
    _totalVat = _totalProductPrice * 0.07;
    _totalPrice = _totalProductPrice + _totalVat;

    notifyListeners();
  }
  //update total price
  updatePricing(final int itemCount, final bool isDeleting,final int index) {

    if (!isDeleting) {
      _myCart[index].totalItem=int.parse(_myCart[index].totalItem.toString())+itemCount;
      _totalProductPrice = _totalProductPrice + (_myCart[index].products.price! * itemCount);
      // notifyListeners();
    }

    else if (isDeleting) {
      _myCart[index].totalItem=int.parse(_myCart[index].totalItem.toString())-itemCount;
      _totalProductPrice = _totalProductPrice - (_myCart[index].products.price! * itemCount);
    }

    _totalVat = _totalProductPrice * 0.07;
    _totalPrice = _totalProductPrice + _totalVat;

    notifyListeners();
  }


  deleteProduct(int index){
    updatePricing(_myCart[index].totalItem as int,true,index);

    _myCart.removeAt(index);
    notifyListeners();
  }
}
