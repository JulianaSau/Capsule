import 'package:flutter/material.dart';

class Product {
  late int id;
  late String title, description, category;
  late List<String> images;
  late List<Color> colors;
  late double rating, price;
  late bool isFavourite, isPopular;
  late int number_in_stock;

  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.number_in_stock,
    required this.category,
  });

  Product.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    id = json["id"];
    category = json["category"];
    description = json["description"];
    rating = json["rating"];
    number_in_stock = json["number_in_stock"];
    price = json["price"];
    images = json["images"];
    colors = json["colors"];
    isFavourite = json["isFavourite"];
    isPopular = json["isPopular"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["title"] = this.title;
    data["description"] = this.description;
    data["images"] = this.images;
    data["colors"] = this.colors;
    data["rating"] = this.rating;
    data["isFavourite"] = this.isFavourite;
    data["isPopular"] = this.isPopular;
    data["price"] = this.price;
    data["description"] = this.description;
    data["number_in_stock"] = this.number_in_stock;
    data["category"] = this.category;

    return data;
  }
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
    isPopular: true,
    number_in_stock: 50,
    category: "Personal Protective Equipment",
  ),
  Product(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
    isPopular: true,
    number_in_stock: 50,
    category: "Personal Protective Equipment",
  ),
  Product(
    id: 3,
    images: [
      "assets/images/glap.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
    number_in_stock: 50,
    category: "Personal Protective Equipment",
  ),
  Product(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
    isFavourite: true,
    number_in_stock: 50,
    category: "Personal Protective Equipment",
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
