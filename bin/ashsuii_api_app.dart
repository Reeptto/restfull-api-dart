// import 'package:ashsuii_api_app/helper/user_helper.dart';
// import 'package:ashsuii_api_app/model/user.dart';
// import 'package:ashsuii_api_app/helper/produk_helper.dart';
// import 'package:ashsuii_api_app/model/produk.dart';
import 'package:ashsuii_api_app/helper/cart_helper.dart';
import 'package:ashsuii_api_app/model/cart.dart';
// import 'package:ashsuii_api_app/model/cart.dart';

void main(List<String> arguments) async {
  print("Sedang mengambil data...");

// Mengambil semua cart
  List<Cart> carts = await CartHelper().getAllCarts();
  print(carts);

// Mengambil semua produk
  // List<dynamic> product = await ProductHelper().getAllProduct();
  // print(product);

// Mengambil produk berdasarkan id
  // Product produk = await ProductHelper().getProductById(1);
  // print(produk);
  // print("Email : ${produk.title}");

// Membuat produk baru
  // Product sentProduct = Product(
  //   id: 21, 
  //   title: "Sabun Mandi", 
  //   price: 2000, 
  //   description: "Mandi bersih berseri", 
  //   category: "Alat mandi");

  //   int idProdukBaru = await ProductHelper().createProduct(sentProduct);
  //   print("Id user yang baru dibuat : $idProdukBaru");


// update produk baru
  // Product productUpdate = Product(
  //   id: 21, 
  //   title: "Pengocok", 
  //   price: 3000, 
  //   description: "Bisa mencampur adonan kue dengan efisien", 
  //   category: "Alat masak");

  //   Product result = await ProductHelper().updateProduct(productUpdate);
  //   print("Hasil update produk : $result");

  

  // List<dynamic> coba = await UserHelper().getAllUser();
  // print(coba);

  // membuat objek untuk menampung data user
    // User pengguna = await UserHelper().getUserById(2);
    // print(pengguna.username);
    // print("Email :${pengguna.email}");

  // membuat user baru
    // User p = User(
    //   id: 10, 
    //   username: "Sartika", 
    //   email: "sartika@gmail.com",
    //   password: "1234");
  
  // kirim data ke endpoint
    // int idUserBaru = await UserHelper().createUser(p);
    // print("id user baru yang dibuat : $idUserBaru");

  // mengupdata user baru
    // User up = User(
    //   id: 2, 
    //   username: "Sartika", 
    //   email: "sartika@gmail.com", 
    //   password: "505050",
    // );

  // Simpan hasil respon
    // User result = await UserHelper().updateUser(up);
    // print("Ini hasil update : $result");
}