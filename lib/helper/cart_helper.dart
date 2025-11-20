import 'package:ashsuii_api_app/model/cart.dart';
// import 'package:ashsuii_api_app/model/cart_produk.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class CartHelper {
  final Map<String, String> _header = {
    "Content-type":"application/json"
  };

  // method mendapatkan semua data cart
  Future<List<Cart>> getAllCarts()async {
     var url = Uri.parse("https://fakestoreapi.com/carts");
     try {
       var respon = await http.get(url);
       if (respon.statusCode == 200) {
        // konversi respon body menjadi dynamic
        List<dynamic> json = jsonDecode(respon.body);
        return json.map((item) => Cart.fromMap(item)).toList();
       }else {
        throw Exception("Error status code :${respon.statusCode}");
       }
     } catch (e) {
        throw Exception("Error :$e");
     }
  }


// method untuk menambah cart baru
  Future<int> createCart(Cart cart) async {
    var url = Uri.parse('https://fakestoreapi.com/carts');
    try {
      var response = await http.post(url, headers: _header, body: jsonEncode({
        'id' : cart.id,
        'userId' : cart.userId,
        'products' : cart.products.map((p) => p.toMap()).toList(),
      }));

      if (response.statusCode == 201) {
            var json = jsonDecode(response.body);
            return json['id'];
          } else {
            throw Exception('Error connection status: ${response.statusCode}');
          }
        } catch (e) {
            throw Exception('Error: $e');
        }
    } 
  


// method untuk mengambil cart by id
  Future<Cart> getCartById(int id) async {
    var url = Uri.parse('https://fakestoreapi.com/carts/$id');
    try {
       var respon = await http.get(url);
       if (respon.statusCode == 200) {
        // konversi respon body menjadi dynamic
        Map<String, dynamic> json = jsonDecode(respon.body);
        return Cart.fromMap(json);
       }else {
        throw Exception("Error status code :${respon.statusCode}");
       }
     } catch (e) {
        throw Exception("Error :$e");
     }
  }


// method untuk update cart
  Future<int> updateCart(Cart cart) async {
    var url = Uri.parse('https://fakestoreapi.com/carts/${cart.id}');
    try {
      var response = await http.put(url, headers: _header, body: jsonEncode({
        'id' : cart.id,
        'userId' : cart.userId,
        'products' : cart.products.map((p) => p.toMap()).toList(),
      }));

      if (response.statusCode == 201) {
            var json = jsonDecode(response.body);
            return json['id'];
          } else {
            throw Exception('Error connection status: ${response.statusCode}');
          }
        } catch (e) {
            throw Exception('Error: $e');
        }
    } 
  }