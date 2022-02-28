import 'package:flutter/material.dart';
import 'dart:convert';

List<ProductList> productListfromJson(String str) => List<ProductList>.from(
    json.decode(str).map((x) => ProductList.fromJson(x)));

String productListToJson(List<ProductList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductList {
  int id;
  String title, description, category;
  List<String> images;
  List<Color> colors;
  double rating, price;
  bool isFavourite, isPopular;
  int number_in_stock, v;
  DateTime createdDate;
  DateTime updatedDate;

  ProductList({
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
    required this.v,
    required this.createdDate,
    required this.updatedDate,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        images: json["images"],
        colors: json["colors"],
        category: json["category"],
        price: json["price"],
        rating: json["rating"],
        isPopular: json["isPopular"],
        isFavourite: json["isFavourite"],
        number_in_stock: json["number_in_stock"],
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "images": images,
        "colors": colors,
        "price": price,
        "category": category,
        "rating": rating,
        "isPopular": isPopular,
        "isFavourite": isFavourite,
        "number_in_stock": number_in_stock,
        "createdDate": createdDate.toIso8601String(),
        "updatedDate": updatedDate.toIso8601String(),
        "__v": v,
      };
}
