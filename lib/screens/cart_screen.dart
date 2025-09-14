import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/components/cart_item_tile.dart';
import 'package:flutter_shopping_cart/models/cart_model.dart';
import 'package:flutter_shopping_cart/providers/cart_provider.dart';
import 'package:flutter_shopping_cart/utils/constant.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: AppFont.heading,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppStyle.padding),
          child: Column(
            children: [
              Expanded(
                child: Selector<CartProvider, List<CartModel>>(
                  selector: (context, provider) => provider.cartItems,
                  builder: (context, cartItems, child) {
                    if (cartItems.isEmpty) {
                      return const Center(child: Text('Your cart is empty'));
                    }
                    return ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final cartItem = cartItems[index];
                        final imagePath = cartItem.itemDoc.imageUrl;
                        final itemId = cartItem.itemId;
                        final itemName = cartItem.itemDoc.itemName;
                        final quantity = cartItem.quantity;
                        final totalPrice = cartItem.totalPrice;
                        final bgColor = cartItem.itemDoc.bgColor;
                        return CartItemTile(
                          imagePath: imagePath,
                          itemId: itemId,
                          itemName: itemName,
                          quantity: quantity,
                          totalPrice: totalPrice,
                          bgColor: bgColor,
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(AppStyle.padding),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppStyle.radius),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Selector<CartProvider, double>(
                      selector: (context, provider) => provider.total,
                      builder: (context, total, child) {
                        return Text(
                          'Total: \$${total.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: AppFontSize.body,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppStyle.padding * 2,
                          vertical: AppStyle.padding,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppStyle.radius),
                        ),
                      ),
                      child: Text('Pay Now'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
