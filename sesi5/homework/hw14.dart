void main() {
  var nilai = [60, 80, 45, 90, 70];

  var lulus = nilai.where((item) {
    return item >= 70;
  }).toList();

  print(lulus);
}
