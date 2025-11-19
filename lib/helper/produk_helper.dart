import 'dart:convert';

import 'package:ashsuii_api_app/model/produk.dart';
import 'package:http/http.dart' as http;

class ProductHelper {
  final Map<String, String> _header = {
    "Content-type":"application/json"
  };

  // method mendapatkan semua data produk
  Future<List<dynamic>> getAllProduct()async {
     var url = Uri.parse("https://fakestoreapi.com/products");
     try {
       var respon = await http.get(url);
       if (respon.statusCode == 200) {
        // konversi respon body menjadi dynamic
        var json = jsonDecode(respon.body);
        return json.map((item) => Product.fromMap(item)).toList();
        // tester return 
        // return [];
       }else {
        throw Exception("Error status code :${respon.statusCode}");
       }
     } catch (e) {
        throw Exception("Error :$e");
     }
  }


   // method update produk
  Future<Product> updateProduct(Product p) async {
     var url = Uri.parse("https://fakestoreapi.com/users/${p.id}");
    try {
      var respon = await http.put(
          url, 
          headers: _header, 
          body: jsonEncode(p.toMap()));
      if (respon.statusCode == 200) {
        var json = jsonDecode(respon.body);
        return Product.fromMap(json);
      }else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }


   // method membuat produk baru
  Future<int> createProduct(Product p)async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    try {
      var respon = await http.post(url, headers: _header, body: jsonEncode(p.toMap()));
      if (respon.statusCode == 201) {
        var json = jsonDecode(respon.body);
        return json["id"];
      }else {
        throw Exception("Error status code :${respon.statusCode}");
      }
    } catch (e) {
      throw Exception("Error :$e");
    }
  }


    // method ambil data user berdasarkan id
  Future<Product> getProductById(int id) async{
    var url = Uri.parse("https://fakestoreapi.com/products/$id");
    try {
      var respon = await http.get(url);
      if (respon.statusCode == 200) {
        // konversi respon ke format map
        var json = jsonDecode(respon.body);
        // konversi menjadi objek user
        return Product.fromMap(json);
      }else {
        int kode = respon.statusCode;
        throw Exception("Error koneksi status :$kode");
      }
    } catch (e) {
      throw Exception("Error : $e");
    }
  } 
}