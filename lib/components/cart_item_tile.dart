import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../utils/constant.dart';
import 'cached_network_image_custom.dart';

class CartItemTile extends StatelessWidget {
  final String itemId;
  final String imagePath;
  final String itemName;
  final int quantity;
  final double totalPrice;
  final Color? bgColor;
  const CartItemTile({
    super.key,
    required this.itemId,
    required this.imagePath,
    required this.itemName,
    required this.quantity,
    required this.totalPrice,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppStyle.padding),
      child: ListTile(
        tileColor: bgColor ?? Colors.white,
        leading: CachedNetworkImageCustom(imagePath: imagePath),
        subtitle: Text(
          'Quantity: $quantity\nTotal: \$${totalPrice.toStringAsFixed(2)}',
        ),
        title: Text(itemName),
        trailing: IconButton(
          onPressed: () =>
              context.read<CartProvider>().removeItemFromCart(itemId: itemId),
          icon: Icon(Icons.delete, color: Colors.red[400]),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppStyle.radius),
        ),
        titleTextStyle: TextStyle(
          fontFamily: AppFont.heading,
          fontWeight: FontWeight.bold,
          fontSize: AppFontSize.body,
          color: Colors.black,
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: AppFont.body,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
