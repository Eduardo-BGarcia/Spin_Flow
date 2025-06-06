import 'package:flutter/material.dart';
import 'package:spin_flow/configuracao/rotas.dart';
import 'package:spin_flow/dashboard/classes/cadastro_classe.dart';
import 'package:spin_flow/dashboard/widgets/cadastro_tile.dart';

class AulasAbas extends StatelessWidget {
  AulasAbas({super.key});

  final List<CadastroTileModel> _items = [
    CadastroTileModel(
        icon: Icons.timer_outlined, title: 'Agendar Aula', routeName: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      itemCount: _items.length,
      itemBuilder: (context, index) => CadastroTile(model: _items[index]),
      separatorBuilder: (context, index) => Divider(
        height: 1,
        thickness: 1,
        color: Colors.grey[200],
      ),
    );
  }
}
