import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter_shopping_cart/models/cart_model.dart';
import 'package:flutter_shopping_cart/models/item_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ItemModel> _productItems = [
    ItemModel(
      itemId: '1',
      itemName: 'Apple',
      price: 0.99,
      imageUrl:
          'https://img.icons8.com/?size=100&id=s3EqD09UVwX5&format=png&color=000000',
      bgColor: const Color(0xFFFFE5E5),
    ),
    ItemModel(
      itemId: '2',
      itemName: 'Banana',
      price: 0.59,
      imageUrl:
          'https://img.icons8.com/?size=100&id=LjAILXrCRYc6&format=png&color=000000',
      bgColor: const Color(0xFFFFF5CC),
    ),
    ItemModel(
      itemId: '3',
      itemName: 'Apricot',
      price: 0.79,
      imageUrl:
          'https://img.icons8.com/?size=100&id=zWL7WzI3sC0T&format=png&color=000000',
      bgColor: const Color(0xFFFFF3E0),
    ),
    ItemModel(
      itemId: '4',
      itemName: 'Grapes',
      price: 2.99,
      imageUrl:
          'https://img.icons8.com/?size=100&id=rH5jq0gWBQyH&format=png&color=000000',
      bgColor: const Color(0xFFEDE7F6),
    ),
    ItemModel(
      itemId: '5',
      itemName: 'Strawberry',
      price: 1.99,
      imageUrl:
          'https://img.icons8.com/?size=100&id=D6mAH6vTkBH4&format=png&color=000000',
      bgColor: const Color(0xFFFFEBEE),
    ),
    ItemModel(
      itemId: '6',
      itemName: 'Pineapple',
      price: 3.49,
      imageUrl:
          'https://img.icons8.com/?size=100&id=yoflzK7JQMwS&format=png&color=000000',
      bgColor: const Color(0xFFFFF8E1),
    ),
    ItemModel(
      itemId: '7',
      itemName: 'Watermelon',
      price: 4.99,
      imageUrl:
          'https://img.icons8.com/?size=100&id=X6lGagd8NZDN&format=png&color=000000',
      bgColor: const Color(0xFFE0F7FA),
    ),
    ItemModel(
      itemId: '8',
      itemName: 'Orange',
      price: 1.29,
      imageUrl:
          'https://img.icons8.com/?size=100&id=VqM2sQYWeyKF&format=png&color=000000',
      bgColor: const Color(0xFFFFF3E0),
    ),
    ItemModel(
      itemId: '9',
      itemName: 'Mango',
      price: 1.49,
      imageUrl:
          'https://img.icons8.com/?size=100&id=zTIYznwjq5u3&format=png&color=000000',
      bgColor: const Color(0xFFFFF3E0),
    ),
    ItemModel(
      itemId: '10',
      itemName: 'Blueberry',
      price: 2.49,
      imageUrl:
          'https://img.icons8.com/?size=100&id=5fIvxsQAKu6e&format=png&color=000000',
      bgColor: const Color(0xFFE3F2FD),
    ),
    ItemModel(
      itemId: '11',
      itemName: 'Cherry',
      price: 3.99,
      imageUrl:
          'https://img.icons8.com/?size=100&id=V1BFyoBBQub7&format=png&color=000000',
      bgColor: const Color(0xFFFFEBEE),
    ),
    ItemModel(
      itemId: '12',
      itemName: 'Dragon Fruit',
      price: 1.89,
      imageUrl:
          'https://img.icons8.com/?size=100&id=t65JtFXRFmIa&format=png&color=000000',
      bgColor: const Color(0xFFFFF3E0),
    ),
    ItemModel(
      itemId: '13',
      itemName: 'Lychee',
      price: 0.89,
      imageUrl:
          'https://img.icons8.com/?size=100&id=4PbAU3p7p1IP&format=png&color=000000',
      bgColor: const Color(0xFFE8F5E9),
    ),
    ItemModel(
      itemId: '14',
      itemName: 'Avocado',
      price: 1.19,
      imageUrl:
          'https://img.icons8.com/?size=100&id=epZ4iwZ8qMCR&format=png&color=000000',
      bgColor: const Color(0xFFFFF3E0),
    ),
  ];

  List<ItemModel> get productItems => _productItems;

  final List<CartModel> _cartItems = [];
  List<CartModel> get cartItems => [..._cartItems];
  int _totalCartItems = 0;
  int get totalCartItems => _totalCartItems;
  double _total = 0.0;
  double get total => _total;

  void addItemToCart({required ItemModel item}) {
    if (_cartItems.isNotEmpty &&
        _cartItems
            .where((element) => element.itemId == item.itemId)
            .isNotEmpty) {
      int index = _cartItems.indexWhere(
        (element) => element.itemId == item.itemId,
      );
      if (index != -1) {
        _cartItems[index] = _cartItems[index].copyWith(
          quantity: _cartItems[index].quantity + 1,
          totalPrice: _cartItems[index].totalPrice + item.price,
        );
      }
    } else {
      _cartItems.add(
        CartModel(
          itemId: item.itemId,
          itemDoc: item,
          quantity: 1,
          totalPrice: item.price,
        ),
      );
    }
    getTotalAndCountCartItems();
    notifyListeners();
  }

  void removeItemFromCart({required String itemId}) {
    _cartItems.removeWhere((item) => item.itemId == itemId);
    getTotalAndCountCartItems();
    notifyListeners();
  }

  void getTotalAndCountCartItems() {
    _totalCartItems = _cartItems.length;
    _total = _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);
  }
}
