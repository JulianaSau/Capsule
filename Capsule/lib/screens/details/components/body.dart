import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

Future addItemToCart(String productId, int quantity) async {
  final response = await http.post(Uri.parse("http://10.0.2.2:3000/api/cart"),
      headers: <String, String>{
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "productId": productId,
        "quantity": quantity,
      }));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response, then parse the JSON.
    return jsonDecode(response.body);
  } else {
    print(response.statusCode);
    print(response.body);
    // If the server did not return a 200 OK response, then throw an exception.
    throw Exception('Failed to load data');
  }
}

class Body extends StatelessWidget {
  final Product product;

  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Colors.white,
                child: Column(
                  children: [
                    // ColorDots(product: product),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () async {
                            var response = await addItemToCart(product.id, 1);
                            print(response);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
