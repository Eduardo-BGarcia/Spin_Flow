class DTOTipoManutencao {
  final String? id;
  final String nome;
  final String? descricao;
  final bool ativo;

  DTOTipoManutencao({
    this.id,
    required this.nome,
    this.descricao,
    this.ativo = true,
  });

  @override
  String toString() {
    return 'DTOTipoManutencao(id: $id, nome: $nome, descricao: $descricao, ativo: $ativo)';
  }
}
