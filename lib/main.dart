import 'package:e_shop/application/provider/lists_of_products.dart';
import 'package:e_shop/application/provider/my_cart.dart';
import 'package:e_shop/presentation/screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => (AllProductsData())),
        ChangeNotifierProvider(create: (_) => (MyCart())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'E Shop',
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthScreen(),
        },
        theme: ThemeData(
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
