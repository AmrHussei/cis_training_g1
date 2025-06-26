import 'package:intl/intl.dart';

String formatNumber(num value) {
  final formatter = NumberFormat("#,##0.###");
  return formatter.format(value);
}

num parseFormattedNumber(String formatted) {
  // Remove commas (or any locale-specific separators)
  final cleaned = formatted.replaceAll(',', '');
  return num.parse(cleaned);
}
