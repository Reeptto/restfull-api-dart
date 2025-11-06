class ProductModel {
  // 1. definisikan var yg ditentukan
  // 2. set ke final supaya tidak dapat dirubah setelah dibuat

  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;

  // constructor
  ProductModel({
      required this.id,
      required this.title,
      required this.description, 
      required this.price,
      required this.category,
      required this.image,
    });

  // method untuk import dari json
  // buat method dengan keyword factory
  factory ProductModel.fromJson(Map<String, dynamic> json) 
  {
    return ProductModel(
      id: json["id"], 
      title: json["title"], 
      description: json["description"], 
      price: json["price"], 
      category: json["category"], 
      image: json["image"]);
  }

}