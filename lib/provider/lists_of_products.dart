import '../api/custom_apies.dart';
import '../api/product_model.dart';

class Providers{
  final List<AllProducts> _allproducts=[];

  List<AllProducts> get getAllProducts
  {return _allproducts;}


  AllProducts? allProductDataModel;
  fetch()async{
    allProductDataModel=await CustomAPIes.fetchAllProductDate();
    _allproducts.addAll(allProductDataModel as Iterable<AllProducts>);
  }


}