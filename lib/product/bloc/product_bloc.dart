import 'dart:async' show Stream;

import 'package:bloc/bloc.dart';
import 'package:bloc_form/product/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductDefaultState(product: Product.empty()));

  Product _product = Product.empty();

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is ProductEventUpdate) {
      _updateProduct(
        name: event.name,
        barCode: event.barCode,
        category: event.category,
        value: event.value,
        image: event.image,
      );
      yield ProductDefaultState(product: _product);
    }
  }

  Product get product => _product;

  _updateProduct(
      {String? name,
      String? barCode,
      String? category,
      double? value,
      String? image}) {
    _product = _product.copyWith(
        name: name,
        barCode: barCode,
        category: category,
        value: value,
        image: image);
  }
}
