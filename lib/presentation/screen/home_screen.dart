import 'package:e_shop/presentation/cloading.dart';
import 'package:e_shop/presentation/screen/profile.dart';
import 'package:e_shop/presentation/screen/search_screen.dart';
import 'package:flutter/material.dart';

import '../../application/provider/lists_of_products.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/toggle_Button.dart';
import 'package:provider/provider.dart';

import 'body_widgets/electronic.dart';
import 'body_widgets/jwellery.dart';
import 'body_widgets/men.dart';
import 'body_widgets/popular.dart';
import 'body_widgets/women.dart';
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
    super.initState();
  }

  List<Widget> bodyChild = [
    const PopularProducts(),
    const ManProducts(),
    const WomanProducts(),
    const JwelleryProducts(),
    const ElectronicProducts(),
  ];
  int bodyIndex = 0;
  @override
  Widget build(BuildContext context) {
    final AllProductsData model = context.watch();
    return Scaffold(
      drawer: const CustomDrawer(),
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
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SearchScreen()));
                    },
                    child: const Text(
                      "Find Your Desire Product",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(Icons.favorite),
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyCartScreen()));
                  },
                ),
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
                    const Text(
                      "CATEGORY",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      primary: false,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ToggleButton(
                              text: "Popular",
                              isActive: true,
                              onTap: () {
                                setState(() {
                                  bodyIndex = 0;
                                });
                              }),
                          ToggleButton(
                              text: "Man",
                              isActive: false,
                              onTap: () {
                                setState(() {
                                  bodyIndex = 1;
                                });
                              }),
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
              child: model.getAllProductsData.isEmpty
                  ? cloading
                  : bodyChild[bodyIndex]),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (v) {
            if (v == 1) {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const Profile()));
            }
          },
          backgroundColor: Colors.yellow,
          elevation: 3,
          unselectedItemColor: Colors.blue,
          selectedItemColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Message"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notificatin"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded), label: "Profile"),
          ]),
    );
  }
}
