import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/components/coustom_bottom_nav_bar.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/categories/components/product_card.dart';

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse("http://10.0.2.2:3000/api/products"));

  if (response.statusCode == 200) {
    List<Product> products = [];
    List<dynamic> productsJson = jsonDecode(response.body);
    print(response.body);

    productsJson.forEach((oneProduct) {
      Product product = Product.fromJson(oneProduct);
      products.add(product);
    });
    return products;
  } else {
    print(response.statusCode);
    throw Exception("Failed to load albums");
  }
}

class CategoriesScreen extends StatefulWidget {
  static String routeName = "/categories";
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Center(
          child: FutureBuilder<List<Product>>(
              future: fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Product>? resData = snapshot.data;
                  return ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: resData != null ? resData.length : 0,
                      itemBuilder: (context, index) {
                        return ProductCard(product: resData![index]);
                      });
                }
                return const CircularProgressIndicator();
              })),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Text(
            "Products",
            style: TextStyle(color: Colors.black),
          ),
          Icon(Icons.search)
        ],
      ),
    );
  }
}
