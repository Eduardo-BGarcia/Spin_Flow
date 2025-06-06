import 'package:flutter/material.dart';

class DTOcadastro {
  final IconData icon;
  final String title;
  final String
      routeName;

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
