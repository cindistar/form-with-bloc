import 'package:bloc_form/product/bloc/product_bloc.dart';
import 'package:bloc_form/product/page/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPage extends StatelessWidget {
  final GlobalKey _formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('New Product'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetails(product: bloc.product),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<ProductBloc, ProductState>(
              bloc: bloc,
              builder: (context, state) {
                var stateProduct = (state as ProductDefaultState);
                var product = stateProduct.product;
                return ListView(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Name',
                      ),
                      onChanged: (name) =>
                          bloc.add(ProductEventUpdate(name: name)),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Category',
                      ),
                      onChanged: (category) =>
                          bloc.add(ProductEventUpdate(category: category)),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Image',
                      ),
                      onChanged: (image) =>
                          bloc.add(ProductEventUpdate(image: image)),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Value',
                      ),
                      onChanged: (value) => bloc
                          .add(ProductEventUpdate(value: double.parse(value))),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Bar Code',
                      ),
                      onChanged: (barCode) =>
                          bloc.add(ProductEventUpdate(barCode: barCode)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 0, bottom: 15, top: 26),
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
                  ],
                );
              }),
        ),
      ),
    );
  }
}
