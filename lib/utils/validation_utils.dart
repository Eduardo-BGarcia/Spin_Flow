String? stringValidator(String? value, {String? customMessage}) {
  if (value == null || value.trim().isEmpty) {
    return customMessage ?? 'Campo Obrigatório';
  }
  return null;
}

String? emailValidator(String? value, {String? customMessage}) {
  if (value == null || value.trim().isEmpty) {
    return customMessage ?? 'Campo Obrigatório';
  }
  final emailRegex =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  if (!emailRegex.hasMatch(value)) {
    return customMessage ?? 'Email inválido, siga o formato: email@example.com';
  }
  return null;
}

String? dateValidator(String? value, {String? customMessage}) {
  if (value == null || value.trim().isEmpty) {
    return customMessage ?? 'Campo Obrigatório';
  }
  final dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  if (!dateRegex.hasMatch(value)) {
    return customMessage ?? 'Data inválida. Use o formato AAAA-MM-DD';
  }
  return null;
}

String? dropdownValidator<T>(
  T? value, {
  String? customMessage,
}) {
  if (value == null) {
    return customMessage ?? 'Campo Obrigatório';
  }
  return null;
}
