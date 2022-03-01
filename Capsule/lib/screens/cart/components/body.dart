import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/models/Cart.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'cart_card.dart';

Future<List<CartItem>> getCartItems() async {
  final response = await http.get(Uri.parse("http://10.0.2.2:3000/api/cart"));

  List<CartItem> cartItems = [];
  if (response.statusCode == 200) {
    Map<String, dynamic> map =
        new Map<String, dynamic>.from(json.decode(response.body));
    // List<String> data = map["data"];
    // print(map);
    print(response.body);
    print(map["data"]["items"][0]);

    map["data"]["items"].forEach((oneProduct) {
      CartItem product = CartItem.fromJson(oneProduct);
      cartItems.add(product);
    });
    return cartItems;
  } else {
    print(response.statusCode);
    throw Exception("Failed to load albums");
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder<List<CartItem>>(
            future: getCartItems(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<CartItem>? resData = snapshot.data;
                return ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: resData != null ? resData.length : 0,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Dismissible(
                      key: Key(resData![index].id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          resData.removeAt(index);
                        });
                      },
                      background: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFE6E6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            SvgPicture.asset("assets/icons/Trash.svg"),
                          ],
                        ),
                      ),
                      child: CartCard(cart: resData[index]),
                    ),
                  ),
                );
              }
              return const CircularProgressIndicator();
            }));
  }
}
