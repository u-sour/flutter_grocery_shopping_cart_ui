import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/components/grocery_item_tile.dart';
import 'package:flutter_shopping_cart/models/item_model.dart';
import 'package:flutter_shopping_cart/providers/cart_provider.dart';
import 'package:flutter_shopping_cart/router/router_utils.dart';
import 'package:flutter_shopping_cart/utils/constant.dart';
import 'package:flutter_shopping_cart/utils/responsive/responsive_layout.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Freshly',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: AppFont.heading,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppStyle.spacing,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppStyle.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Good morning, User!',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontFamily: AppFont.heading,
                    fontSize: AppFontSize.body,
                  ),
                ),
                Text(
                  'Let\'s order fresh items for you',
                  style: TextStyle(
                    fontFamily: AppFont.heading,
                    fontWeight: FontWeight.bold,
                    fontSize: AppFontSize.heading,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 0.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppStyle.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppStyle.spacing,
                children: [
                  Text(
                    'Fresh Items',
                    style: TextStyle(
                      fontFamily: AppFont.heading,
                      fontWeight: FontWeight.bold,
                      fontSize: AppFontSize.body,
                      color: Colors.grey[600],
                    ),
                  ),
                  Expanded(
                    child: Selector<CartProvider, List<ItemModel>>(
                      selector: (_, state) => state.productItems,
                      builder: (_, data, _) => GridView.builder(
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: ResponsiveLayout.isLaptop(context)
                              ? 3
                              : ResponsiveLayout.isDesktop(context)
                              ? 4
                              : 2,
                          crossAxisSpacing: AppStyle.spacing,
                          mainAxisSpacing: AppStyle.spacing,
                        ),
                        itemBuilder: (context, index) {
                          final productItems = data[index];
                          return GroceryItemTile(
                            itemId: productItems.itemId,
                            itemName: productItems.itemName,
                            itemPrice: '\$${productItems.price}',
                            imagePath: productItems.imageUrl,
                            backgroundColor: productItems.bgColor,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        clipBehavior: Clip.none, // so badge can go outside FAB
        children: [
          FloatingActionButton(
            onPressed: () => context.pushNamed(SCREENS.cart.name),
            child: Icon(Icons.shopping_cart),
          ),
          // Badge
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.red[400],
                shape: BoxShape.circle,
              ),
              child: Selector<CartProvider, int>(
                selector: (_, state) => state.totalCartItems,
                builder: (_, totalCartItems, _) => Text(
                  '$totalCartItems', // badge count
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppFontSize.body,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
