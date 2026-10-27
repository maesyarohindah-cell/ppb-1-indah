void main() {
  Set<String> hadir = {'Indah', 'Widi'};

  hadir.add('Budi');
  hadir.add('Wowo'); // tidak masuk dua kali
  print(hadir);

  hadir.remove('Widi');
  print(hadir);

  print(hadir.contains('Widi'));
  print(hadir.length);
}
