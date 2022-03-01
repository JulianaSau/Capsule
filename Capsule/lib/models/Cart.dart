import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
// import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'Product.dart';

class CartItem {
  late int numOfItem;
  late String title;
  late double price;
  late String id;
  late List<dynamic> images;

  CartItem(
      {required this.price,
      required this.numOfItem,
      required this.title,
      required this.images});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["data"]["items"] = this.title;
    data["data"]["quantity"] = this.numOfItem;

    return data;
  }

  CartItem.fromJson(Map json) {
    // Map<String, dynamic> map = new Map<String, dynamic>.from(json);
    title = json["productId"]["title"];
    price = json["price"];
    numOfItem = json["quantity"];
    id = json["productId"]["_id"];
    images = json["productId"]["images"];
  }
}

// Demo data for our cart

List<CartItem> demoCarts = [
  CartItem(
      title: "Omeprazole",
      images: ["htttps://bit.ly/segun-adebayo"],
      price: 500,
      numOfItem: 2),
  CartItem(
      title: "Omeprazole",
      images: ["htttps://bit.ly/segun-adebayo"],
      price: 500,
      numOfItem: 2),
  CartItem(
      title: "Omeprazole",
      images: ["htttps://bit.ly/segun-adebayo"],
      price: 500,
      numOfItem: 2),
];

class Cart with ChangeNotifier {
  List<CartItem> cartItems = [];

  Future<List<CartItem>> getCartItems() async {
    final response = await http.get(Uri.parse("http://10.0.2.2:3000/api/cart"));

    if (response.statusCode == 200) {
      List<dynamic> cartItemsJson = jsonDecode(response.body);
      print(response.body);

      cartItemsJson.forEach((oneProduct) {
        CartItem product = CartItem.fromJson(oneProduct);
        cartItems.add(product);
      });
      return cartItems;
    } else {
      print(response.statusCode);
      throw Exception("Failed to load albums");
    }
  }

  // double get total {
  //   return cartItems.fold(0.0, (double currentTotal, Product nextProduct) {
  //     return currentTotal + nextProduct.price;
  //   });
  // }

  // void addToCart(Product product) => cartItems.add(product);
  // void removeFromCart(Product product) {
  //   cartItems.remove(product);
  //   notifyListeners();
  // }
}

class Store {
  StreamController<List<Product>> _streamController =
      StreamController<List<Product>>();
  Stream<List<Product>> get allProductsForSale => _streamController.stream;

  // rest of class
}
