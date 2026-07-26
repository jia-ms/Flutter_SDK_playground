class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final int stock;
  final String image;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.stock,
    required this.image,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["id"],
      name: json["name"],
      category: json["category"],
      price: (json["price"] as num).toDouble(),
      rating: (json["rating"] as num).toDouble(),
      stock: json["stock"],
      image: json["image"],
      description: json["description"],
    );
  }
}