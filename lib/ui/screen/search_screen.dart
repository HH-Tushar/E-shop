import 'package:e_shop/ui/screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/models/all_product_model.dart';
import '../../provider/lists_of_products.dart';

class SearchScreen extends StatefulWidget {

  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Products>result=[];


  void update(String value){
    List<Products>allProduct= Provider.of<AllProductsData>(context, listen: false).getAllProductsData;
    setState(() {
      result=allProduct.where((element) => element.title!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
 
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          result.clear();
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back),),
        title:  Container(
          height: 45,
          width: 300,
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),

          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                isCollapsed: true,
                hintStyle: TextStyle(fontSize: 18)),
            onChanged: (value){
              update(value);
            },
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: result.length,
          itemBuilder: (_,index)=>ListTile(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(selectedProduct: result[index],)));},
            title: Text(result[index].title.toString(),maxLines: 1,),
            leading: Image.network(result[index].image.toString()),
            subtitle: Text("Price : ${result[index].price}\$"),
          )

      )

    );
  }
}
