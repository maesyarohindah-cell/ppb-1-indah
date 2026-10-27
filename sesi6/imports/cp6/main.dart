import 'heavy_report.dart' deferred as heavy;

Future<void> main() async {
  print("Dashboard POS siap.");
  // Saat butuh laporan bulanan
  await heavy.loadLibrary();
  heavy.loadMonthlyReport();
}
