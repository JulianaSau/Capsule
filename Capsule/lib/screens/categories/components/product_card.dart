import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/models/Product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: getProportionateScreenWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: FadeInImage.assetNetwork(
                        image: product.images[1],
                        placeholder: "../../../assets/medicine.png"),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                  SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "\$${product.price}",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor),
                      children: [
                        TextSpan(
                            text: "",
                            style: Theme.of(context).textTheme.bodyText1),
                      ],
                    ),
                  )
                ],
              ),
            ]),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                height: getProportionateScreenWidth(28),
                width: getProportionateScreenWidth(28),
                decoration: BoxDecoration(
                  color: product.isFavourite
                      ? kPrimaryColor.withOpacity(0.15)
                      : kSecondaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  "assets/icons/Heart Icon_2.svg",
                  color: product.isFavourite
                      ? Color(0xFFFF4848)
                      : Color(0xFFDBDEE4),
                ),
              ),
            ),
          ],
        ));
  }
}
