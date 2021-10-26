import 'package:bloc_form/product/bloc/product_bloc.dart';
import 'package:bloc_form/product/page/product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<ProductBloc>(
        create: (BuildContext context) => ProductBloc(),
        child: ProductPage(),),
    );
  }
}

