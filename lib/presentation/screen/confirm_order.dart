import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/provider/my_cart.dart';

class ConfirmOrder extends StatelessWidget {
  const ConfirmOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final MyCart model = context.watch();
    void saveName(String value) {}
    return Scaffold(
        appBar: AppBar(
          title: const Text("Confirm Order"),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Column(children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: "Hasibul Hasan",
                      onSaved: ((value) => saveName(value.toString())),
                      onChanged: ((value) => saveName(value)),
                      onFieldSubmitted: ((value) => saveName(value)),
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      initialValue: "01400431268",
                      onSaved: ((value) => saveName(value.toString())),
                      onChanged: ((value) => saveName(value)),
                      onFieldSubmitted: ((value) => saveName(value)),
                      readOnly: true,
                      decoration: const InputDecoration(
                        labelText: "Phone",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              TextFormField(
                initialValue: "Dhaka",
                onSaved: ((value) => saveName(value.toString())),
                onChanged: ((value) => saveName(value)),
                onFieldSubmitted: ((value) => saveName(value)),
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Product Name"), Text("Quantity")],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: model.getMyCartData.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                        model.getMyCartData[index].products.title.toString()),
                    subtitle: Text(
                        "Unit Price ${model.getMyCartData[index].products.price}"),
                    trailing: Text(
                      model.getMyCartData[index].totalItem.toString(),
                      style: cartPricingStyle,
                    ),
                  ),
                ),
              ),

              //total bill
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    //heading

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Price",
                          style: cartTotalPricingStyle,
                        ),
                        Text(
                          "${Provider.of<MyCart>(context).getTotalPrice.toStringAsFixed(2)}\$",
                          style: cartTotalPricingStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                child: MaterialButton(
                  minWidth: double.infinity,
                  elevation: 2,
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  child: const Text(
                    "Place Order",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}

TextStyle cartPricingStyle = const TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
TextStyle cartTotalPricingStyle = const TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

class OrderModel {
  String customerName;
  String customerPhone;
  String customerAddress;
  List<TempProduct> products;
  OrderModel(
      {required this.customerName,
      required this.customerPhone,
      required this.customerAddress,
      required this.products});
}

class TempProduct {
  String name;
  String unitPrice;
  String quantity;
  TempProduct(
      {required this.name, required this.quantity, required this.unitPrice});
}
