extension StringExtension on String {
  DateTime dateTimeFromDDMMYYYY() {
    final date = split('/');

    return DateTime(
      int.parse(date[2]),
      int.parse(date[1]),
      int.parse(date[0]),
    );
  }

  String formatToCPF() {
    String formatedCpf = replaceFirstMapped(
      RegExp(r'(\d{3})(\d{3})(\d{3})(\d{2})'),
      (match) => '${match[1]}.${match[2]}.${match[3]}-${match[4]}',
    );

    return formatedCpf;
  }
}
