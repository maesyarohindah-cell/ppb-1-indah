void main() {
  List<Map<String, dynamic>> mahasiswa = [
    {'nama': 'Indah', 'nilai': 80},
    {'nama': 'Cihuyy', 'nilai': 95},
    {'nama': 'Zizah', 'nilai': 70},
  ];

  mahasiswa.sort((a, b) => (b['nilai'] as int).compareTo(a['nilai'] as int));

  for (var mhs in mahasiswa) {
    print('${mhs['nama']}: ${mhs['nilai']}');
  }
}
