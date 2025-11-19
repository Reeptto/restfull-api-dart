import 'package:ashsuii_api_app/model/cart.dart';
// import 'package:ashsuii_api_app/model/cart_produk.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class CartHelper {
  final Map<String, String> _header = {
    "Content-type":"application/json"
  };

  // method mendapatkan semua data produk
  Future<List<Cart>> getAllCarts()async {
     var url = Uri.parse("https://fakestoreapi.com/carts");
     try {
       var respon = await http.get(url);
       if (respon.statusCode == 200) {
        // konversi respon body menjadi dynamic
        List<dynamic> json = jsonDecode(respon.body);
        return json.map((item) => Cart.fromMap(item)).toList();
        // tester return 
        // return [];
       }else {
        throw Exception("Error status code :${respon.statusCode}");
       }
     } catch (e) {
        throw Exception("Error :$e");
     }
  }
}