import 'package:intl/intl.dart';

extension StringExtension on String {
  String? formatTimeHMMA() {
    DateTime? parsedDate = DateTime.tryParse(this);
    if (parsedDate != null) {
      return DateFormat('h:mm a').format(parsedDate);
    }
    return null;
  }

  String? formatDateDMY() {
    DateTime? parsedDate = DateTime.tryParse(this);
    if (parsedDate != null) {
      return DateFormat('dd/MM/yyyy').format(parsedDate);
    }
    return null;
  }
}
