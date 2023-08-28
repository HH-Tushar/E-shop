import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../api/custom_apies.dart';
import '../api/models/all_product_model.dart';

class AllProductsData extends ChangeNotifier{

   late List<Products> _allproducts=[];

  List<Products> get getAllProductsData
  {return _allproducts;}


  Products? allProductDataModel;
  fetch()async{
    _allproducts=await CustomAPIes.fetchAllProductDate();
    notifyListeners();
  }


}


