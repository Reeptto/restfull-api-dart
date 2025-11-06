import 'package:http/http.dart' as http;
import 'package:ashsuii_api_app/model/user.dart';

// function ambil data dari server
Future<UserModel> getUserById(int id) async {
  var url = Uri.parse("https://fakestoreapi.com/users/$id");
  print("Sedang mengambil data user....");

  // error handler
  try{
    // lakukan request http ke endpoint
    var response = await http.get(url);
    
    if (response.statusCode == 200){
      UserModel user = UserModel.fromJson(response.body);
      return user;
    } else {
      // jika gagal
      throw Exception("Gagal mengambil data....");
    }
  } catch (e) {
    throw Exception("Terjadi Kesalahan : $e");
  }
}