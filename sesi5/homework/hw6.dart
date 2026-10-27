void produk({String nama = " ", int harga = 0}) {
  print("produk $nama");
  print("Harga Rp$harga");
}

void main() {
  produk(harga: 15000, nama: "Buku");
}
