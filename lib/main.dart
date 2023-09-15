import 'package:e_shop/provider/lists_of_products.dart';
import 'package:e_shop/provider/my_cart.dart';
import 'package:e_shop/ui/screen/auth_screen.dart';
import 'package:e_shop/ui/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>(AllProductsData())),
        ChangeNotifierProvider(create: (_)=>(MyCart())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'E Shop',
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthScreen(),
        },
        theme:
          ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
            scaffoldBackgroundColor: Colors.teal.shade50,
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
           //useMaterial3: true,

        ),
       //home: SliverDummy(),
      ),
    );
  }
}




