import 'package:e_shop/ui/screen/product_details.dart';
import 'package:e_shop/ui/screen/search_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../provider/lists_of_products.dart';
import '../../provider/my_cart.dart';
import '../constants.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/toggle_Button.dart';
import 'package:provider/provider.dart';

import 'my_Cart_Screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Provider.of<AllProductsData>(context, listen: false).fetch();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: CustomDrawer(),
      backgroundColor: Colors.teal.shade50,
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.teal,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Icon(Icons.menu_outlined),
                Container(
                  height: 35,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchScreen()));},
                    child: const Text(
                      "Find Your Desire Product",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.favorite),
                IconButton(
                    icon:const Icon(Icons.shopping_cart),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCartScreen()));
                    },),
              ],
            ),
            automaticallyImplyLeading: true,

            expandedHeight: 150,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              // preferredSize: Size.fromHeight(70),
              background: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // SizedBox(height: 50),
                    const Text("CATEGORY",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 5),),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ToggleButton(
                              text: "Popular", isActive: true, onTap: () {}),
                          ToggleButton(
                              text: "Man", isActive: false, onTap: () {}),
                          ToggleButton(
                              text: "Woman", isActive: false, onTap: () {}),
                          ToggleButton(
                              text: "Jewellery", isActive: false, onTap: () {}),
                          ToggleButton(
                              text: "Electronics",
                              isActive: false,
                              onTap: () {}),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<AllProductsData>(
              builder: (context, allProductData, child) => GridView.builder(
                  padding: const EdgeInsets.all(10),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 276,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: allProductData.getAllProductsData.length,
                  itemBuilder: (_, index) {
                    //print(allProductData.getAllProductsData[index].rating?.rate);
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetails(
                                      selectedProduct: allProductData
                                          .getAllProductsData[index],
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Hero(
                                tag: allProductData
                                    .getAllProductsData[index].title
                                    .toString(),
                                child: Image.network(
                                  allProductData.getAllProductsData[index].image
                                      .toString(),
                                  height: 150,
                                )),
                            Text(
                              allProductData.getAllProductsData[index].title
                                  .toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$" +
                                    "${allProductData.getAllProductsData[index].price}"),
                                Text(
                                    "★ ${allProductData.getAllProductsData[index].rating?.rate}(${allProductData.getAllProductsData[index].rating?.count})"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.favorite),
                                MaterialButton(
                                  onPressed: () {
                                    //adding items in my cart
                                    Provider.of<MyCart>(context, listen: false).addItemsInCart(allProductData.getAllProductsData[index]);
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
                  }),
            ),
          ),
        ],
      )),
      // bottomNavigationBar: BottomNavigationBar(
      //     backgroundColor: Colors.yellow,
      //     elevation: 3,
      //     unselectedItemColor: Colors.blue,
      //     selectedItemColor: Colors.green,
      //     items: [
      //   BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Home"),
      //   BottomNavigationBarItem(icon: Icon(Icons.message),label: "Message"),
      //   BottomNavigationBarItem(icon: Icon(Icons.notifications),label: "Notificatin"),
      //   BottomNavigationBarItem(icon: Icon(Icons.person_rounded),label: "Profile"),
      // ]),
    );
  }
}
