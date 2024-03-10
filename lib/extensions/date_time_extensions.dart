import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String get formattedDate => DateFormat('dd.MM.yyyy').format(this!);
}
