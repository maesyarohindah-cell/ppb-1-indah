void mahasiswa({String nama = "Tanpa Nama", String status = "Aktif"}) {
  print("Nama: $nama");
  print("Status: $status");
}

void main() {
  mahasiswa(nama: "Indah ");
  mahasiswa(nama: "Yuli", status: "Cuti");
}
