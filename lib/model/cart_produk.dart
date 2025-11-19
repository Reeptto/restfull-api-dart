import 'dart:convert';

class CartProduk {
  final int productId;
  final int quantity;
  CartProduk({
    required this.productId,
    required this.quantity,
  });

  CartProduk copyWith({
    int? productId,
    int? quantity,
  }) {
    return CartProduk(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'quantity': quantity,
    };
  }

  factory CartProduk.fromMap(Map<String, dynamic> map) {
    return CartProduk(
      productId: map['productId']?.toInt() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartProduk.fromJson(String source) => CartProduk.fromMap(json.decode(source));

  @override
  String toString() => 'CartProduk(productId: $productId, quantity: $quantity)';

 
}