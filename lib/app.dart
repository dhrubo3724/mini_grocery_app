import 'package:flutter/material.dart';
import 'package:grocery/models/cart_model.dart';
import 'package:provider/provider.dart';

import 'module/pages/intro_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
      ),
    );
  }
}
