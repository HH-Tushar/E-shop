import 'package:e_shop/ui/screen/home_screen.dart';
import 'package:e_shop/ui/screen/sliver_demy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E Shop',
      theme:
        ThemeData(
          textTheme: GoogleFonts.latoTextTheme(
            Theme.of(context).textTheme,
          ),
         useMaterial3: true,

      ),
     //home: SliverDummy(),
      home: const HomeScreen(),
    );
  }
}




