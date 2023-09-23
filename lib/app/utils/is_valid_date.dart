import 'package:intl/intl.dart';

class DateValidator {
  static bool isValidDate(String input) {
    try {
      final date = DateFormat('dd/MM/yyyy').parseStrict(input);
      final finalDate = DateTime.now();
      final initialDate = DateTime.parse('1900-01-01');

      if (date.isAfter(finalDate) || date.isBefore(initialDate)) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
