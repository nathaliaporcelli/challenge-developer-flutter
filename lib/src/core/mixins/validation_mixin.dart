mixin ValidationMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value == null || value.isEmpty) return message ?? 'Campo obrigatório';
    return null;
  }

  String? isEmail(String? value, [String? message]) {
    if (value == null || value.isEmpty) return message ?? 'Email não é válido';
    return null;
  }

  String? isCPF(String? value, [String? message]) {
    if (value == null || value.isEmpty) return message ?? 'CPF não é válido';
    return null;
  }
}
