import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String barCode;
  final String category;
  final double value;
  final String image;

  Product({required this.name, required this.barCode, required this.category, required this.value, required this.image});

  Product.empty(
    {
    this.name = '',
    this.barCode = '',
    this.category = '',
    this.value = 0.0,
    this.image = '',
  });

  @override
  List<Object?> get props => [
        name,
        barCode,
        category,
        value,
        image,
      ];

  Product copyWith(
      {String? name,
      String? barCode,
      String? category,
      double? value,
      String? image}) {
    return Product(
      name: name ?? this.name,
      barCode: barCode ?? this.barCode,
      category: category ?? this.category,
      value: value ?? this.value,
      image: image ?? this.image,
    );
  }
}
