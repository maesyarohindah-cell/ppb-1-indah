import 'package:intl/intl.dart';

void main() {
  int harga = 2400000000;

  var rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  print(rupiah.format(harga));
}
