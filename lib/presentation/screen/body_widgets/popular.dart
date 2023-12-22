import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../application/provider/lists_of_products.dart';
import '../../../application/provider/my_cart.dart';
import '../../../ui/screen/product_details.dart';
import '../../constants.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  void initState() {
    Provider.of<AllProductsData>(context, listen: false).fetch();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AllProductsData model = context.watch();
    
    SnackBar itemAddedSuccessfully = const SnackBar(
      content: Text('Item Added Successfully'),
    );
    SnackBar itemAlreadyExist = const SnackBar(
      content: Text('Item Already Exist in cart !'),
    );

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 276,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemCount: model.getAllProductsData.length,
      itemBuilder: (_, index) {
        //print(allProductData.getAllProductsData[index].rating?.rate);

        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ProductDetails(
                          selectedProduct: model.getAllProductsData[index],
                        )));
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Hero(
                    tag: model.getAllProductsData[index].title.toString(),
                    child: Image.network(
                      model.getAllProductsData[index].image.toString(),
                      height: 150,
                    )),
                Text(
                  model.getAllProductsData[index].title.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$" + "${model.getAllProductsData[index].price}"),
                    Text(
                        "★ ${model.getAllProductsData[index].rating?.rate}(${model.getAllProductsData[index].rating?.count})"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite),
                    MaterialButton(
                      onPressed: () {
                        //adding items in my cart
                        bool isExist =
                            Provider.of<MyCart>(context, listen: false)
                                .checkItem(model.getAllProductsData[index]);
                        if (isExist) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(itemAlreadyExist);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(itemAddedSuccessfully);
                        }
                      },
                      child: Text("Add to Cart"),
                      color: buttonColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
