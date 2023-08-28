import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../provider/my_cart.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(title: const Text("My Items"),centerTitle: true,titleTextStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 25,letterSpacing: 4,)),
      body:Provider.of<MyCart>(context).getMyCartData.isNotEmpty?
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Consumer<MyCart>(
            builder: (context, snap, child){

              return ListView.builder(
              shrinkWrap: true,
              itemCount:snap.getMyCartData.length ,
              itemBuilder: (context,index){
               //  totalProductprice=totalProductprice+(double.parse(snap.getMyCartData[index].products.price.toString())*double.parse(snap.getMyCartData[index].totalItem.toString()));
                return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Slidable(
                  direction: Axis.horizontal,
                  startActionPane:  ActionPane(
                      motion: const StretchMotion(),
                      children: [
                    SlidableAction(
                      onPressed: (context){
                        Provider.of<MyCart>(context,listen: false).deleteProduct(index);
                      },
                      autoClose: true,
                      padding: EdgeInsets.all(10),
                      borderRadius: BorderRadius.circular(10),
                      backgroundColor: Colors.red,
                      icon: Icons.delete,)
                  ]),
                  child: ListTile(
                    tileColor: Colors.grey.shade100,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),

                    leading: Image.network(snap.getMyCartData[index].products.image.toString(),height: 70,fit: BoxFit.fitHeight,),

                    title: Text(snap.getMyCartData[index].products.title.toString(),maxLines: 2,),

                    subtitle: Text("Price : ${snap.getMyCartData[index].products.price} \$"),
                    trailing:  SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          ElevatedButton(
                              onPressed: (){
                                Provider.of<MyCart>(context,listen: false).updatePricing(1, false,index);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                              child: const Icon(Icons.add)
                          ),

                          Text(snap.getMyCartData[index].totalItem.toString()),

                          ElevatedButton(
                              onPressed: (){
                                Provider.of<MyCart>(context,listen: false).updatePricing(1, true,index);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                              ),
                              child: const Icon(Icons.remove)
                          ),


                        ],
                      ),
                    ),
                  ),
                ),
              );}
            );},
          ),

          //total bill
          Container(
            padding: EdgeInsets.all(10),
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
                  Text("product Price",style: cartPricingStyle,),
                  Text("${Provider.of<MyCart>(context).getTotalProductPrice.toStringAsFixed(2)}\$",style: cartPricingStyle,),
                ],) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Total Valt (7%)",style: cartPricingStyle,),
                  Text("${Provider.of<MyCart>(context).getTotalVat.toStringAsFixed(2)}\$",style: cartPricingStyle,),
                ],),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Total Price",style: cartTotalPricingStyle,),
                  Text("${Provider.of<MyCart>(context).getTotalPrice.toStringAsFixed(2)}\$" ,style: cartTotalPricingStyle,),
                ],),

              ],
            ),
          )
        ],
      ):const Center(child: Text("You Have Not Added Any Item Yet : ("),),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
        child: MaterialButton(
          elevation: 2,
          color: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          onPressed: (){},
          child: Text("Purchase",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,letterSpacing: 2),),
        ),
      ),
    );
  }
}
TextStyle cartPricingStyle=TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);
TextStyle cartTotalPricingStyle=TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
);