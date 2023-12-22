import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

import '../../application/api/models/all_product_model.dart';

class ProductDetails extends StatelessWidget {
  final Products selectedProduct;
  const ProductDetails({Key? key, required this.selectedProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Product Details",
                      style: buttonText,
                    ),
                    Hero(
                        tag: selectedProduct.title.toString(),
                        child: Image.network(
                          selectedProduct.image.toString(),
                          height: 500,
                        )),
                    const SizedBox(height: 15),
                    Text(
                      selectedProduct.title.toString(),
                      style: titleText,
                    ),
                    const SizedBox(height: 8),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "⭐ ${selectedProduct.rating!.rate}",
                          style: bodyText,
                        )),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Description : ",
                          style: subTitleText,
                        )),
                    ExpandableText(
                      selectedProduct.description.toString(),
                      linkColor: Colors.blue,
                      expandText: 'See More',
                      collapseText: "See Less",
                      style: bodyText,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          "Product Category : ",
                          style: subTitleText,
                        ),
                        Text(
                          "${selectedProduct.category}",
                          style: bodyText,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Divider(indent: 20, endIndent: 20),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: MaterialButton(
                color: Colors.teal.shade300,
                padding: const EdgeInsets.all(5),
                shape: const CircleBorder(),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.clear),
              ),
            ),
            // child: IconButton(onPressed: (){},icon: Icon(Icons.arrow_back_ios),color: Colors.black,),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        height: 70,
        decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Text(
          "Add To Cart",
          style: buttonText,
        ),
      ),
    );
  }
}

TextStyle bodyText = TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
TextStyle titleText = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
TextStyle subTitleText = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
TextStyle buttonText = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 2);
