import 'package:bloc_form/product/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  const ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 0, bottom: 15, top: 26),
              child: Text('Detalhes do Produto'),
            ),
            Text('Name: ${product.name}'),
            Text('Category: ${product.category}'),
            Text('Image: ${product.image}'),
            Text('Value: ${product.value.toString()}'),
            Text('Barcode: ${product.barCode}'),
          ],
        ),
      ),
    );
  }
}
