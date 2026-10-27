void main() {
  List<String> input = ['80', 'sembilan puluh', '75'];

  for (var teks in input) {
    try {
      int nilai = int.parse(teks);
      print('Nilai: $nilai');
    } on FormatException {
      print('"$teks" bukan angka');
    }
  }
}
