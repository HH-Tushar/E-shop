import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../application/api/models/ordermodel.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference usersRef = firestore
        .collection('user'); // Replace 'users' with your collection name
        
final List<Products> temp = [];
    final OrderModel model = OrderModel(
        customerAddress: 'sjdvksjbdvkjsb',
        customerName: 'somart',
        customerPhone: '34567',
        products: temp);

   
    final Products p = Products();
    for (int i = 0; i < 4; i++) {
      temp.add(Products(hd[0].name));
    }
    void add() async {
      // await myRef.set({"name": "John Doe", "age": 30});
      //usersRef.add({'name': 'John Doe', 'age': 30, 'city': 'New York'});
      usersRef.add(model.toJson());

      //  await usersRef. .collection("cities").doc("new-city-id").set({"name": "Chicago"});
    }

    return Scaffold(
      body: Center(
          child: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          add();
        },
      )),
    );
  }
}
