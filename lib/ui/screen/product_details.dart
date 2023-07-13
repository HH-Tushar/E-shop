import 'package:e_shop/api/product_model.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
class ProductDetails extends StatelessWidget {
  final AllProducts sellectedProduct;
  const ProductDetails({Key? key, required this.sellectedProduct}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//           appBar:AppBar(
//               elevation: 0,
// bottomOpacity: 0, toolbarOpacity: 0,
//             titleSpacing: 0,
//             automaticallyImplyLeading: false,
//             leading: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back_ios),),
//          ),

     body: SafeArea(
       child: Stack(
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: SingleChildScrollView(
               child: Column(
                 children: [
                   Image.network(sellectedProduct.image.toString(),height: 500,),
                   SizedBox(height: 15),

                   Text(sellectedProduct.title.toString()),
                   SizedBox(height: 8),
                   Align(
                       alignment: Alignment.centerRight,
                       child: Text(sellectedProduct.rating!.rate.toString())),
                    ExpandableText(
                      sellectedProduct.description.toString(),linkColor: Colors.blue,
                      expandText: 'See More',collapseText: "See Less",),
                   Text("Product Catagory : ${sellectedProduct.category}",
                   ),

                 ],
               ),
             ),
           ),
           Positioned(

             top: 0,
             left: 0,
             child: MaterialButton(
               padding: EdgeInsets.all(5),
               shape: CircleBorder(),
               onPressed: (){Navigator.pop(context);},
               child: Icon(Icons.clear),) ,
               ),
             // child: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back_ios),color: Colors.black,),

         ],
       ),
     ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
  margin: EdgeInsets.all(10),
  height: 70,
  decoration: BoxDecoration(
      color: Colors.green,
    borderRadius: BorderRadius.all(Radius.circular(15))
  ),

),
    );
  }
}
