import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  int cartCount = 0;

  @override
  void initState() {
    super.initState();

    loadCart();
  }

  // ---------------------------
  // LOAD CART COUNT
  // ---------------------------

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();

    int savedCount = prefs.getInt('cartCount') ?? 0;

    setState(() {
      cartCount = savedCount;
    });
  }

  // ---------------------------
  // ADD ITEM
  // ---------------------------

  Future<void> addItem() async {
    final prefs = await SharedPreferences.getInstance();

    cartCount++;

    await prefs.setInt('cartCount', cartCount);

    setState(() {});
  }

  // ---------------------------
  // CLEAR CART
  // ---------------------------

  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('cartCount');

    setState(() {
      cartCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text('My Shopping App'),
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Icon(
              Icons.shopping_cart,
              size: 80,
            ),

            const SizedBox(height: 20),

            Text(
              'Cart Items: $cartCount',

              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton.icon(
              onPressed: addItem,

              icon: const Icon(Icons.add_shopping_cart),

              label: const Text('Add Item'),
            ),

            const SizedBox(height: 15),

            OutlinedButton(
              onPressed: clearCart,

              child: const Text('Clear Cart'),
            ),
          ],
        ),
      ),
    );
  }
}