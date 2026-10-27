enum StatusMahasiswa { aktif, cuti, lulus }

void main() {
  var status = StatusMahasiswa.cuti;

  if (status == StatusMahasiswa.aktif) {
    print("Mahasiswa masih aktif kuliah.");
  } else if (status == StatusMahasiswa.cuti) {
    print("Mahasiswa lagi cuti");
  } else if (status == StatusMahasiswa.lulus) {
    print("Mahasiswa sudah lulus, sedang mencari kerja");
  } else {
    print("Data tidak ditemukan");
  }
}
