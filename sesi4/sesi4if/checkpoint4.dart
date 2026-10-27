void main() {
  String status = "Aktif";

  switch (status) {
    case "Aktif":
      print("Mahasiswa Aktif");
    case "Cuti":
      print("Mahasiswa Cuti");
    case "Lulus":
      print("Mahasiswa sudah Lulus");
    default:
      print("status tidak diketahui");
  }
}
