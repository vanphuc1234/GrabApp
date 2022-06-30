// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_grab_app/mon_an_construct.dart';
import 'package:provider/provider.dart';
import 'products_page_widget.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ChiTietMonAn(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grab Food',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
      ),
      home: const ProductsPageWidget(title: 'Grab Food Demo'),
    );
  }
}
