class DTOVideoAula {
  final String? id;
  final String nome;
  final String? descricao;
  final String dia_aula;
  final String hora_aula;
  final String url;
  final bool ativo;

  DTOVideoAula({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.dia_aula,
    required this.hora_aula,
    required this.url,
    this.ativo = true,
  });

  @override
  String toString() {
    return 'DTOVideoAula(id: $id, name: $nome, descricao: $descricao, dia_aula: $dia_aula, hora_aula: $hora_aula, url: $url ativo: $ativo)';
  }
}
