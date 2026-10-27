void main() {
  Map<String, int> stok = {'Pulpen': 50, 'Pensil': 30, 'Penghapus': 25};
  print(stok.keys);
  print(stok.values);
  print(stok.containsKey('Pensil'));
  stok.remove('Pensil');

  print(stok);
  int total = 0;
  for (var jumlah in stok.values) {
    total += jumlah;
  }
  print('Total stok: $total');
}
