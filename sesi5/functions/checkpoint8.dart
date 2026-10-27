void sapa(String nama, [String pesan = "Selamat datang"]) {
  print("Halo $nama, $pesan!");
}

void main() {
  sapa("Indah");
  sapa("Cihuyyy", "Selamat belajar Dart");
}
