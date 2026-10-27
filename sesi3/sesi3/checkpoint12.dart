void main() {
  var mahasiswa = {"TI001": "Budi", "TI002": "Ani", "TI003": "Citra"};

  print("Nama mahasiswa TI001: ${mahasiswa['TI001']}");

  mahasiswa["TI004"] = "Doni";

  print("Jumlah mahasiswa: ${mahasiswa.length}");
  print("Daftar mahasiswa: $mahasiswa");

  final prodi = const {1: "TI", 2: "SI", 3: "MI"};
  print("Kode Prodi: $prodi");
}
