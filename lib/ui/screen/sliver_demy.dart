import 'package:e_shop/ui/screen/dummy.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class SliverDummy extends StatelessWidget {
  const SliverDummy({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final item=[
      Image.asset("assets/offer1.jpg",width:double.infinity,),
      Image.asset("assets/offer2.jpg",width:double.infinity,)];
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              excludeHeaderSemantics: true,
              pinned: true,

              toolbarHeight: 60,//this is for main appbar
              // title: Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children:  [
              //   Icon(Icons.menu_outlined),
              //   Container(
              //     padding: EdgeInsets.only(left: 10,right: 10),
              //     height: 35,
              //     width: 220,
              //     decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.circular(100),
              //     ),
              //     child: Row(children: [
              //       //Icon(Icons.search),
              //       Text("Search Your Desire Product",style: TextStyle(fontSize: 15,color: Colors.grey),),
              //     ],),
              //   ),
              //   Icon(Icons.shopping_cart),
              // ],),

              expandedHeight: 240,
              flexibleSpace: FlexibleSpaceBar(

                  background: CarouselSlider(
                    items:item,
                    options: CarouselOptions(
                      height: double.infinity,
                    autoPlay: true,
                    aspectRatio: 16/9,
                    viewportFraction: 1,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      // setState(() {
                      //   currentIndex = index;
                      // });
                    },
                  ),)
              ),

              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(children: [
                    ToggleButton(text: "Man", isActive: true, onTap: (){}),
                    ToggleButton(text: "WoMan", isActive: false, onTap: (){}),
                    ToggleButton(text: "Jew", isActive: true, onTap: (){}),
                  ],),
                )),
            ),





            SliverToBoxAdapter(
              child: ListView.builder(
                primary: false,
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (_,index)=>Container(height: 100,color: Colors.blue,margin: const EdgeInsets.all(10),)),)
          ],
        ),
    );
  }
}
