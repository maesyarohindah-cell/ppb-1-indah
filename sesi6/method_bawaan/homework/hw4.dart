void main() {
  List<String> daftarNama = ['Indah', 'Zizah', 'Citra', 'Dewi'];
  String kataKunci = 'AH';

  for (var nama in daftarNama) {
    if (nama.toLowerCase().contains(kataKunci.toLowerCase())) {
      print(nama);
    }
  }
}
