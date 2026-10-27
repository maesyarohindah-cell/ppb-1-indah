void main() {
  List<String> krs = ['Basis Data', 'Statistika'];
  krs.add('Pemrograman Web');
  print(krs);
  krs.remove('Statistika');
  print(krs);
  print(krs.contains('Basis Data'));
  print(krs.length);
  krs.clear();
  print(krs);

  print(krs.isEmpty);
}
