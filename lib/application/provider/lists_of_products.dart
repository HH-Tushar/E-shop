import 'package:flutter/foundation.dart';
import '../api/custom_apies.dart';
import '../api/models/all_product_model.dart';

class AllProductsData extends ChangeNotifier {
  late List<Products> _allproducts = [];
  final List<Products> _women = [];
  final List<Products> _man = [];
  final List<Products> _jewellery = [];
  final List<Products> _electronic = [];

  List<Products> get getAllProductsData {
    return _allproducts;
  }

  List<Products> get getWomanProductsData {
    return _women;
  }

  List<Products> get getManProductsData {
    return _man;
  }

  List<Products> get getJewelleryProductsData {
    return _jewellery;
  }

  List<Products> get getElectronicProductsData {
    return _electronic;
  }

  Products? allProductDataModel;
  fetch() async {
    _allproducts = await CustomAPIes.fetchAllProductDate();
    notifyListeners();
  }

  segmented() {
    for (var item in _allproducts) {
      if (item.category == "women's clothing") {
        _women.add(item);
      }
      //men
      else if (item.category == "men's clothing") {
        _man.add(item);
      }
      //electronic
      else if (item.category == "electronics") {
        _electronic.add(item);
      }
      //jewlwrry
      else if (item.category == "jewelery") {
        _jewellery.add(item);
      }
    }
    notifyListeners();
  }
}
