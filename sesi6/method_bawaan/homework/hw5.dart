void main() {
  String kodeInput = '  if201 ';
  String kode = kodeInput.trim().toUpperCase();

  print('Kode: $kode');
  print('Kosong: ${kode.isEmpty}');
  print('Prodi IF: ${kode.contains('IF')}');
}
