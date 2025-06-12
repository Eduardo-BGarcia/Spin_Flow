import 'package:flutter/material.dart';
import 'package:spin_flow/DTO/DTOcadastro.dart';

class CadastroTile extends StatelessWidget {
  final DTOcadastro model;

  const CadastroTile({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(model.icon, color: Theme.of(context).colorScheme.primary),
      title: Text(
        model.title,
        style: TextStyle(
            fontSize: 16, color: Theme.of(context).textTheme.bodyLarge?.color),
      ),
      onTap: () => Navigator.pushNamed(context, model.routeName),
    );
  }
}
