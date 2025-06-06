enum GeneroEnum {
  masculino("Masculino"),
  feminino("Feminino"),
  outro("Outro"),
  naoInformado("Não Informado");

  final String? value;

  const GeneroEnum([this.value]);

  String get descricao {
    switch (this) {
      case GeneroEnum.masculino:
        return 'Masculino';
      case GeneroEnum.feminino:
        return 'Feminino';
      case GeneroEnum.outro:
        return 'Outro';
      case GeneroEnum.naoInformado:
        return 'Não Informado';
    }
  }

  static GeneroEnum? fromValue(String? value) {
    if (value == null) return null;
    return GeneroEnum.values.firstWhere(
      (genero) => genero.toString() == value,
      orElse: () => GeneroEnum.naoInformado,
    );
  }

  static List<Map<String, String>> get dropdownOptions {
    return GeneroEnum.values.map((genero) {
      return {
        'value': genero.toString(),
        'label': genero.descricao,
      };
    }).toList();
  }
}
