import 'package:flutter/material.dart';

class DTOBandaArtista {
  final IconData icon;
  final String? id;
  final String nome;
  final String? descricao;
  final String dia_semana;
  final String hora_inicio;
  final int duracao_minutos;
  final int sala;
  final bool ativo;
  final routeName;

  DTOBandaArtista({
    required this.icon,
    required this.id,
    required this.nome,
    required this.descricao,
    required this.dia_semana,
    required this.hora_inicio,
    required this.duracao_minutos,
    required this.sala,
    required this.ativo,
    required this.routeName,
  });
  @override
  String toString() {
    return 'DTOBandaArtista(icon: $icon, id: $id, nome: $nome, descricao: $descricao, dia_semana: $dia_semana, hora_inicio: $hora_inicio, sala: $sala, ativo: $ativo, routeName: $routeName)';
  }
}
