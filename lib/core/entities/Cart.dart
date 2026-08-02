import 'package:ecommerce_app/core/entities/CartProduct.dart';

class Cart {
   final int? id;
  final int userId;
  final DateTime date;
  final List<CartProduct> products;
  final int v;

  Cart({
     this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      userId: json['userId'],
      date: DateTime.parse(json['date']), // 🔥 important
      products: (json['products'] as List)
          .map((e) => CartProduct.fromJson(e))
          .toList(),
      v: json['__v'],
    );
  }
}