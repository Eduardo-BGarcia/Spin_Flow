import 'package:flutter/material.dart';

class DTOInfoCard {
  final IconData icon;
  final String value;
  final String title;
  final Color color;

  DTOInfoCard({
    required this.icon,
    required this.value,
    required this.title,
    required this.color,
  });

  @override
  String toString() {
    return 'DTOInfoCard(icon: $icon, value: $value, title: $title, color: $color)';
  }
}
