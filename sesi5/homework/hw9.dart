void hitungTotal(int harga, [int jumlah = 1]) {
  int total = harga * jumlah;
  print("Total: Rp$total");
}

void main() {
  hitungTotal(10000);
  hitungTotal(10000, 3);
}
