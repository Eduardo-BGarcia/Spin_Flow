class DTOSala {
  String? id;
  String nome;
  int capacidade_total_bikes;
  int numero_filas;
  int numero_bikes_por_fila;
  bool ativo;

  DTOSala({
    this.id,
    required this.nome,
    required this.capacidade_total_bikes,
    required this.numero_filas,
    required this.numero_bikes_por_fila,
    this.ativo = true,
  });
}