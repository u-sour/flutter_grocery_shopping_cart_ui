import 'package:flutter/widgets.dart';

class ItemModel {
  final String itemId;
  final String itemName;
  final double price;
  final String imageUrl;
  final Color? bgColor;

  const ItemModel({
    required this.itemId,
    required this.itemName,
    this.price = 0.0,
    required this.imageUrl,
    this.bgColor,
  });
}
