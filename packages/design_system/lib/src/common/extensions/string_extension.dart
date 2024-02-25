extension StringExtension on String? {
  DateTime dateTimeFromDDMMYYYY() {
    if (this == null) return DateTime.now();

    final date = this!.split('/');

    return DateTime(
      int.parse(date[2]),
      int.parse(date[1]),
      int.parse(date[0]),
    );
  }
}
