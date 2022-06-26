// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/models/Product.dart';

class Cart {
  final Product product;
  final int numOfItems;
  Cart({
    required this.product,
    required this.numOfItems,
  });

  
}

List<Cart> demoCarts = [
  Cart(product: demoProducts[0], numOfItems: 1),
  Cart(product: demoProducts[1], numOfItems: 1),
  Cart(product: demoProducts[0], numOfItems: 1),
];
