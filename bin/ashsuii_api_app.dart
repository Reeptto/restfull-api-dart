import 'package:ashsuii_api_app/helper/user_helper.dart';
import 'package:ashsuii_api_app/model/cart_produk.dart';
import 'package:ashsuii_api_app/model/user.dart';
import 'package:ashsuii_api_app/helper/produk_helper.dart';
import 'package:ashsuii_api_app/model/produk.dart';
import 'package:ashsuii_api_app/helper/cart_helper.dart';
import 'package:ashsuii_api_app/model/cart.dart';


Future<void> user() async {
   print("====================================");
   print("           OPERASI USER             ");
   print("====================================");

   print("Mengambil Semua user");
   List<dynamic> coba = await UserHelper().getAllUser();
   print(coba);

   print("Membuat user baru");
    User pengguna = await UserHelper().getUserById(2);
    print(pengguna.username);
    print("Email :${pengguna.email}");
    User p = User(
      id: 10, 
      username: "Sartika", 
      email: "sartika@gmail.com",
      password: "1234");
  
    int idUserBaru = await UserHelper().createUser(p);
    print("id user baru yang dibuat : $idUserBaru");

    print("Mengupdate User");
    User up = User(
      id: 2, 
      username: "Sartika", 
      email: "sartika@gmail.com", 
      password: "505050",
    );
    User result = await UserHelper().updateUser(up);
    print("Ini hasil update : $result");

    print("====================================");
    print("        OPERASI USER SELESAI        ");
    print("====================================");
}


Future<void> product() async {
   print("====================================");
   print("           OPERASI PRODUK           ");
   print("====================================");

   print("Mengambil Semua produk");
   List<dynamic> product = await ProductHelper().getAllProduct();
   print(product);

   print("Membuat produk baru");
   Product sentProduct = Product(
      id: 21, 
      title: "Sabun Mandi", 
      price: 2000, 
      description: "Mandi bersih berseri", 
      category: "Alat mandi");

      int idProdukBaru = await ProductHelper().createProduct(sentProduct);
      print("Id user yang baru dibuat : $idProdukBaru");

    print("Mengambil Produk By Id");
    Product produk = await ProductHelper().getProductById(1);
    print(produk);
    print("Email : ${produk.title}");


    print("Mengupdate Produk");
    Product productUpdate = Product(
        id: 21, 
        title: "Pengocok", 
        price: 3000, 
        description: "Bisa mencampur adonan kue dengan efisien", 
        category: "Alat masak");

        Product results = await ProductHelper().updateProduct(productUpdate);
        print("Hasil update produk : $results");

   print("====================================");
   print("       OPERASI PRODUK SELESAI       ");
   print("====================================");

}

Future<void> cart() async {
   print("====================================");
   print("            OPERASI CART            ");
   print("====================================");

   print("Mengambil semua cart");
   List<Cart> carts = await CartHelper().getAllCarts();
   print(carts);

   print("Menambah Cart baru");
   List<CartProduk> productsToBuy = [
        CartProduk(productId: 5, quantity: 3),
        CartProduk(productId: 8, quantity: 1),
    ];
    Cart newCart = Cart(id: 1, userId: 5, products: productsToBuy);
    int cartBaru = await CartHelper().createCart(newCart);
    print("Id cart yang baru dibuat $cartBaru");


    print("Mengambil cart by id");
    Cart cartById = await CartHelper().getCartById(1);
    print("Cart ID ${cartById.id} : ${cartById.products}");


    print("Mengupdate cart");
    List<CartProduk> productsToUpdate = [
        CartProduk(productId: 5, quantity: 3),
        CartProduk(productId: 8, quantity: 1),
    ];
    Cart updateCart = Cart(id: 1, userId: 5, products: productsToUpdate);
    int cartUpdate = await CartHelper().createCart(updateCart);
    print("Id cart yang baru dibuat $cartUpdate");

   print("====================================");
   print("         OPERASI CART SELESAI       ");
   print("====================================");
}

void main(List<String> arguments) async {
  await user();
  await Future.delayed(Duration(seconds : 5));
  await product();
  await Future.delayed(Duration(seconds : 5));
  await cart();
}