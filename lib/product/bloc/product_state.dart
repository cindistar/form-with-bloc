part of 'product_bloc.dart';

@immutable
abstract class ProductState  {
  const ProductState();

}

class ProductInitial extends ProductState {}

class ProductDefaultState extends ProductState {
  final Product product;

  ProductDefaultState({required this.product});

}
