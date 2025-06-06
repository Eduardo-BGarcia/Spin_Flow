import 'package:flutter/material.dart';

class DTOBandaArtista {
  final IconData icon;
  final String? id;
  final String nome;
  final String? descricao;
  final String? link_relacionado;
  final String? url_foto_perfil;
  final bool ativo;
  final routeName;

  DTOBandaArtista({
    required this.icon,
    required this.id,
    required this.nome,
    required this.descricao,
    required this.link_relacionado,
    required this.url_foto_perfil,
    required this.ativo,
    required this.routeName,
  });
  @override
  String toString() {
    return 'DTOBandaArtista(icon: $icon, id: $id, nome: $nome, descricao: $descricao, link_relacionado: $link_relacionado, url_foto_perfil: $url_foto_perfil, ativo: $ativo)';
  }
}
