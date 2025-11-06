// import 'package:ashsuii_api_app/helper/produk_helper.dart' as helper;

import 'package:ashsuii_api_app/helper/user_helper.dart' as users;
import 'package:ashsuii_api_app/model/user.dart';

void main(List<String> arguments) async {
  // print(helper.ambilProduk());
  print("Ambil data dari user....");
  UserModel pengguna = await users.getUserById(3);
  print(pengguna.username);
} 
