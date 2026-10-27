void main() {
  final produk = ['Beras', 'Gula', 'Kopi', 'Susu'];
  for (final item in produk) {
    print('Mencari: $item');

    if (item == 'Kopi') {
      print('Produk ditemukan!');
      break;
    }
  }
  print("program selesai");
}
