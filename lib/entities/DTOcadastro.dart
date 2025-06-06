import 'package:flutter/material.dart';

class DTOcadastro {
  final IconData icon;
  final String title;
  final String
      routeName; // Usamos a rota em vez de um callback para um modelo mais limpo

  DTOcadastro({
    required this.icon,
    required this.title,
    required this.routeName,
  });
  @override
  String toString() {
    return 'DTOcadastro(icon: $icon, title: $title, title: $title, routeName: $routeName)';
  }
}
