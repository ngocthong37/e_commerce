import 'package:e_commerce/screens/detail_product/components/body.dart';
import 'package:e_commerce/screens/detail_product/components/custom_app_bar.dart';
import 'package:flutter/material.dart';


import 'package:e_commerce/models/Product.dart';

class DetailProductScreen extends StatelessWidget {
  static String routeName = "/detail_product";
  const DetailProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductDetailArguments arguments =
        ModalRoute.of(context)!.settings.arguments as ProductDetailArguments;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        child: CustomAppBar(
          rating: arguments.product.rating), 
          preferredSize: Size.fromHeight(AppBar().preferredSize.height)),
      body: Body(product: arguments.product,),
    );
  }
}

class ProductDetailArguments {
  final Product product;
  ProductDetailArguments({
    required this.product,
  });
}
