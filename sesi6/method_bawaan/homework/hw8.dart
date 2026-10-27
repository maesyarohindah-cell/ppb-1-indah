void main() {
  List<String> nama = ['Wowo', 'Indah', 'Cihuyyy', 'Budi'];

  nama.add('Widi');
  nama.remove('Wowo');
  nama.sort((a, b) => a.compareTo(b));

  print(nama);
  print('Jumlah: ${nama.length}');
}
