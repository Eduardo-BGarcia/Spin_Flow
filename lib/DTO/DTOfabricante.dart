class DTOFabricante {
  String? id;
  String nome;
  String? descricao;
  String? nome_contato_principal;
  String? email_contato;
  String? telefone_contato;
  bool ativo;

  DTOFabricante({
    this.id,
    required this.nome,
    this.descricao,
    this.nome_contato_principal,
    this.email_contato,
    this.telefone_contato,
    this.ativo = true,
  });
}