import 'help.dart' deferred as help;

Future<void> main() async {
  print("Aplikasi siap digunakan.");

  await help.loadLibrary();
  await help.tampilkanBantuan();
}
