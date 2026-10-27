void main() {
  final angkatan = <int, List<String>>{
    2020: ['Andi', 'Budi'],
    2021: ['Citra', 'Dewi'],
    2025: ['Udin', 'Indah'],
  };

  outerLoop:
  for (final tahun in angkatan.keys) {
    for (final mhs in angkatan[tahun]!) {
      print('Angkatan $tahun - $mhs');

      if (mhs == 'Indah') {
        print('Berhenti di Indah!');
        break outerLoop; // Hentikan semua loop.
      }
    }
  }
}
