import 'package:http/http.dart' as http;
import 'dart:convert';

// function untuk mengambil data produk dari API
Future<void> ambilProduk() async{
  // siapkan endpoint (url)
  var alamat = Uri.parse("https://fakestoreapi.com/products/1");
  print("Sedang mengambil data....");
  // error handling 
  try{
    //  blok perintah yg coba dijalankan jika error lempar ke catch
    var response = await http.get(alamat);
    if (response.statusCode == 200) {
      print("Ada respon dari server");
      var hasil = jsonDecode(response.body);  
      print(hasil); 
    } else{
      print("tidak ada respon");
    }

  }catch(e){
    print('Gagal : $e');
  }

}