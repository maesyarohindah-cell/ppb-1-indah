void main() {
  var angka = [1, 2, 3];
  var hasil = angka.map((item) => item * 2).toList();
  print(hasil);

  var mahasiswa = ["Indah", "Yuli", "Udin"];
  mahasiswa.forEach((nama) => print("Halo, $nama!"));
}
