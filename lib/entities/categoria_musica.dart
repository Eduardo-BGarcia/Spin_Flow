class DTOCategoriaMusica {
  final String? id;
  final String nome;
  final String? descricao;
  final bool ativo;

  DTOCategoriaMusica({
    this.id,
    required this.nome,
    this.descricao,
    this.ativo = true,
  });

  @override
  String toString() {
    return 'DTOCategoriaMusica(id: $id, nome: $nome, descricao: $descricao, ativo: $ativo)';
  }
}
