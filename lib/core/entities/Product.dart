import 'package:ecommerce_app/core/entities/Rating.dart';

class Product {
   final int? id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating? rating;

  Product({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
     this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(), // 🔥 important
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: Rating.fromJson(json['rating']),
    );
  }
}