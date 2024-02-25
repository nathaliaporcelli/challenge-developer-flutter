mixin ValidationMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value == null || value.isEmpty) return message ?? 'Campo obrigatório';
    return null;
  }

  String? isEmail(String? value, [String? message]) {
    if (value == null || value.isEmpty) return message ?? 'Email não é válido';
    final regex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    if (regex.hasMatch(value)) {
      return null;
    }

    return message ?? 'Email não é válido';
  }

  String? isCPF(String? value, [String? message]) {
    isNotEmpty(value, message);

    final invalidMessage = message ?? 'CPF inválido';

    final numeros = value!.replaceAll(RegExp('[^0-9]'), '');

    if (numeros.length != 11) return message ?? 'O CPF deve conter 11 dígitos';

    if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return invalidMessage;

    final digitos = numeros.split('').map(int.parse).toList();

    var calcDv1 = 0;
    for (final i in Iterable<int>.generate(9, (i) => 10 - i)) {
      calcDv1 += digitos[10 - i] * i;
    }
    calcDv1 %= 11;
    final dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

    if (digitos[9] != dv1) return invalidMessage;

    var calcDv2 = 0;
    for (final i in Iterable<int>.generate(10, (i) => 11 - i)) {
      calcDv2 += digitos[11 - i] * i;
    }
    calcDv2 %= 11;
    final dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

    if (digitos[10] != dv2) return invalidMessage;

    return null;
  }
}
