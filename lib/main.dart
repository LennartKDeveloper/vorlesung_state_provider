import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vorlesung_state_provider/Item_card_provider.dart';
import 'package:vorlesung_state_provider/homepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemCardProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
