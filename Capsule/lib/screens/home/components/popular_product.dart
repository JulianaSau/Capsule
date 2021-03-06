import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/categories/categories_page.dart';

import '../../../size_config.dart';
import 'section_title.dart';

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

class PopularProducts extends StatefulWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(
            title: "Popular Products",
            press: () =>
                Navigator.pushNamed(context, CategoriesScreen.routeName),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Container(
          height: 230.0,
          child: FutureBuilder<List<Product>>(
              future: fetchProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Product>? resData = snapshot.data;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: resData != null ? resData.length : 0,
                      itemBuilder: (context, index) {
                        if (resData![index].isPopular)
                          return ProductCard(product: resData[index]);

                        return SizedBox.shrink();
                      });
                }
                return const CircularProgressIndicator();
              }),
        )
      ],
    );
  }
}
