class Product {
  final int id;
  final String name;
  final String description;
  final String image;
  final String rating;
  final String price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      rating: json['rating'] ?? '0',
      price: json['price'] ?? '0.0',
    );
  }
}
