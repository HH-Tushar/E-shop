import 'package:e_shop/ui/screen/product_details.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../api/product_model.dart';
import '../constants.dart';
import 'dummy.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


   String apiUrl = 'https://fakestoreapi.com/products';

   List<AllProducts>allProduct=[];
   AllProducts ? myProducts;
   var responseBody;

   void fetchDate()async{
     final response=await http.get(Uri.parse(apiUrl));
     if (response.statusCode == 200) {
       responseBody=jsonDecode(response.body);
       for(var item in responseBody){
         allProduct.add(
             AllProducts(
               id:item['id'],
               title:item['title'],
               price:item['price'],
               description:item['description'],
             category:item['category'],
             image:item['image'],
                 rating:Rating(
                  rate: item['rating']['rate'] ,
                    count: item['rating']['count'],

                 )


             ));
       }
   }
     setState(() {

     });
   }

  @override
  void initState() {
    fetchDate();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor:backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          
          slivers:[
           SliverAppBar(
             pinned: true,
             title: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children:  [
              // Icon(Icons.menu_outlined),
               Container(
                 padding: EdgeInsets.only(left: 10,right: 10),
                 height: 35,
                 width: 220,
                 decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(100),
                 ),
                 child: Row(children: [
                   //Icon(Icons.search),
                   Text("Find Your Desire Product",style: TextStyle(fontSize: 15,color: Colors.grey),),
                 ],),
               ),
               Icon(Icons.favorite),
               Icon(Icons.shopping_cart),
             ],),

             //expandedHeight: 200,
             // flexibleSpace: FlexibleSpaceBar(background: Container(
             //     child: Row(
             //       mainAxisAlignment: MainAxisAlignment.center,
             //       children: [
             //       CircleAvatar(child: Icon(Icons.person_rounded)),
             //       Column(
             //         mainAxisAlignment: MainAxisAlignment.center,
             //         children: [
             //           Text("hi Tushar"),
             //           Text("Good Morning"),
             //         ],
             //       )
             //     ],),
             //   ),
             // ),

             bottom: PreferredSize(
               preferredSize: Size.fromHeight(70),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     //SizedBox(height: 10),
                     Text("Catagory"),
                     SizedBox(height: 10),
                     SingleChildScrollView(
                       primary: false,
                       scrollDirection: Axis.horizontal,
                       child: Row(
                         //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         ToggleButton(text: "Popular", isActive: true, onTap: (){}),
                         ToggleButton(text: "Man", isActive: false, onTap: (){}),
                         ToggleButton(text: "Woman", isActive: false, onTap: (){}),
                         ToggleButton(text: "Jewellery", isActive: false, onTap: (){}),
                         ToggleButton(text: "Electronics", isActive: false, onTap: (){}),
                       ],
             ),
                     ),
                   ],
                 ),
               ),),
           ),

               


            

              SliverToBoxAdapter(
                child: GridView.builder(
                  padding: EdgeInsets.all(10),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisExtent: 275,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10
                    ),

                     itemCount: allProduct.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(sellectedProduct: allProduct[index],)));},
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.network(allProduct[index].image.toString(),height: 150,),

                              Text(allProduct[index].title.toString(),
                                  maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 20),),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("\$" +"${allProduct[index].price}"),
                                Text("*${allProduct[index].rating?.rate}(${allProduct[index].rating?.count})"),

                               // IconButton(onPressed: (){}, icon: Icon(Icons.add_shopping_cart))
                              ],),

                              Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: MaterialButton(
                                  onPressed: (){},
                                  child: Text("Add to Cart"),color: buttonColor,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)) ,),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),

            ],
    )) ,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.yellow,
          elevation: 3,
          unselectedItemColor: Colors.blue,
          selectedItemColor: Colors.green,
          items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.message),label: "Message"),
        BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Notificatin"),
        BottomNavigationBarItem(icon: Icon(Icons.person_rounded),label: "Profile"),
      ]),
      );
  }
}
