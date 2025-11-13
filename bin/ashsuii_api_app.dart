import 'package:ashsuii_api_app/helper/user_helper.dart';
import 'package:ashsuii_api_app/model/user.dart';
void main(List<String> arguments) async {
  print("Sedang mengambil data...");

  List<dynamic> coba = await UserHelper().getAllUser();
  print(coba);

  // membuat objek untuk menampung data user
  User pengguna = await UserHelper().getUserById(2);
  print(pengguna.username);
  print("Email :${pengguna.email}");

  // membuat user baru
  User p = User(
    id: 10, 
    username: "Sartika", 
    email: "sartika@gmail.com", 
    password: "1234");
  
  // kirim data ke endpoint
  int idUserBaru = await UserHelper().createUser(p);
  print("id user baru yang dibuat : $idUserBaru");

  // mengupdata user baru
  User up = User(
    id: 2, 
    username: "Sartika", 
    email: "sartika@gmail.com", 
    password: "505050",
  );

  // Simpan hasil respon
  User result = await UserHelper().updateUser(up);
  print("Ini hasil update : $result");
}