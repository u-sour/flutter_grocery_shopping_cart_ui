import 'package:flutter_shopping_cart/models/item_model.dart';

class CartModel {
  final String itemId;
  final ItemModel itemDoc;
  final int quantity;
  final double totalPrice;

  const CartModel({
    required this.itemId,
    required this.itemDoc,
    required this.quantity,
    required this.totalPrice,
  });

  // Create a copy of the CartModel with updated fields
  CartModel copyWith({
    String? itemId,
    ItemModel? itemDoc,
    int? quantity,
    double? totalPrice,
  }) {
    return CartModel(
      itemId: itemId ?? this.itemId,
      itemDoc: itemDoc ?? this.itemDoc,
      quantity: quantity ?? this.quantity,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
