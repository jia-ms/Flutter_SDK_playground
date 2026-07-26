import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:counterapp/models/product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  Future<void> loadProducts() async {
    final jsonString = await rootBundle.loadString("assets/products.json");

    final List<dynamic> jsonData = json.decode(jsonString);

    setState(() {
      products = jsonData.map((e) => Product.fromJson(e)).toList();
    });
  }

  void deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "E-Commerce",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: products.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined,
                size: 60, color: Colors.grey),
            SizedBox(height: 10),
            Text("No Products Found"),
          ],
        ),
      )
          : ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 4,
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                  const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.image_not_supported),
                ),
              ),
              title: Text(
                product.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.category),
                  Text("₹${product.price.toStringAsFixed(0)}"),
                  Text("⭐ ${product.rating}"),
                  Text("Stock: ${product.stock}"),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => deleteProduct(index),
              ),
            ),
          );
        },
      ),
    );
  }
}