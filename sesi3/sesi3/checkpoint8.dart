void main() {
  var _ = 'Halo';
  var _ = "Dart";

  var nama = "Indah";

  print("Halo, $nama!");
  print("Jumlah karakter: ${nama.length}");

  var multi = '''
Ini adalah
string multi-baris
''';

  print(multi);

  var raw = r'Tidak ada \n escape disini';
  print(raw);
}
