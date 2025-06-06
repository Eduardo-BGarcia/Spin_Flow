import 'package:flutter/material.dart';

class CadastroTileModel {
  final IconData icon;
  final String title;
  final String
      routeName; // Usamos a rota em vez de um callback para um modelo mais limpo

  CadastroTileModel({
    required this.icon,
    required this.title,
    required this.routeName,
  });
}
