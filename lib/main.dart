import 'package:b/client/token_manager.dart';
import 'package:b/navbar/navbar.dart';
import 'package:b/page/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/item_models.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});


  @override
  Widget build(BuildContext context)  {

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const LoginPage()
    );
  }
}
