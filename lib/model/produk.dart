import 'dart:convert';

class Product {
    final int id;
    final String title;
    final int price;
    final String description;
    final String category;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
  });


// constructor, konversi dari atau ke json 


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      price: map['price']?.toInt() ?? 0,
      description: map['description'] ?? '',
      category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, description: $description, category: $category)';
  }
}
