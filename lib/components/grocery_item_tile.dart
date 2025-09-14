import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item_model.dart';
import '../providers/cart_provider.dart';
import '../utils/constant.dart';
import 'cached_network_image_custom.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemId;
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final Color? backgroundColor;
  const GroceryItemTile({
    super.key,
    required this.itemId,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    CartProvider readCartProvider = context.read<CartProvider>();
    return InkWell(
      onTap: () => readCartProvider.addItemToCart(
        item: ItemModel(
          itemId: itemId,
          itemName: itemName,
          price: double.parse(itemPrice.replaceAll('\$', '')),
          imageUrl: imagePath,
          bgColor: backgroundColor ?? Colors.grey[200]!,
        ),
      ),
      borderRadius: BorderRadius.circular(AppStyle.radius),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: CachedNetworkImageCustom(imagePath: imagePath)),
          const SizedBox(height: AppStyle.spacing),
          Container(
            padding: const EdgeInsets.all(AppStyle.padding),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.grey[200],
              borderRadius: BorderRadius.circular(AppStyle.radius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  itemName,
                  style: const TextStyle(
                    fontSize: AppFontSize.body,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  itemPrice,
                  style: const TextStyle(
                    fontSize: AppFontSize.body,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
