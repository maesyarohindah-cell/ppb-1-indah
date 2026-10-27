import 'dart:io';

void main() {
  bool isLoggedIn = false;

  stdout.write("Masukkan username: ");
  String? username = stdin.readLineSync();

  if (username == "Indah") {
    isLoggedIn = true;
  }

  if (isLoggedIn) {
    print("Login berhasil! Selamat datang, $username.");
  } else {
    print("Login gagal!");
  }
  print("Tipe data is Loggedin adalah: ${isLoggedIn.runtimeType}");
}
