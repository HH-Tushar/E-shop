import 'package:flutter/material.dart';


var drawerTextColor = TextStyle(
  color: Colors.grey[600],
);
var tilePadding =  const EdgeInsets.only(left: 40.0, right: 40, top: 8,bottom: 8);

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const DrawerHeader(
              child: Icon(
                Icons.favorite,
                size: 64,
              ),
            ),
            Padding(
              padding: tilePadding,
              child: ListTile(
                leading: const Icon(Icons.home),
                title: Text(
                  'D A S H B O A R D',
                  style: drawerTextColor,
                ),
              ),
            ),
            Padding(
              padding: tilePadding,
              child: ListTile(
                leading: const Icon(Icons.settings),
                title: Text(
                  'S E T T I N G S',
                  style: drawerTextColor,
                ),
              ),
            ),
            Padding(
              padding: tilePadding,
              child: ListTile(
                leading: const Icon(Icons.info),
                title: Text(
                  'A B O U T',
                  style: drawerTextColor,
                ),
              ),
            ),
            const Divider(indent: 25,endIndent: 25),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: tilePadding,
                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    //tileColor:Colors.black12,
                    leading: const Icon(Icons.logout),
                    title: Text(
                      'L O G O U T',
                      style: drawerTextColor,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      );
  }
}


