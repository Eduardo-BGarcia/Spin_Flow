import 'package:flutter/material.dart';
import 'package:spin_flow/configuracao/rotas.dart';
import 'package:spin_flow/dashboard/classes/cadastro_classe.dart';
import 'package:spin_flow/dashboard/widgets/cadastro_tile.dart';

class CadastrosAbas extends StatelessWidget {
  CadastrosAbas({super.key});

  final List<CadastroTileModel> _items = [
    CadastroTileModel(
        icon: Icons.video_library_outlined, title: 'Vídeo Aula', routeName: ''),
    CadastroTileModel(
        icon: Icons.person_add_alt_1_outlined, title: 'Aluno', routeName: ''),
    CadastroTileModel(
        icon: Icons.business_outlined, title: 'Fabricante', routeName: Rotas.cadastroFabricante),
    CadastroTileModel(
      icon: Icons.door_back_door_outlined, title: 'Sala', routeName: Rotas.cadastroSala),
    CadastroTileModel(
        icon: Icons.build_outlined,
        title: 'Tipo de Manutenção',
        routeName: Rotas.cadastroTipoManutencao),
    // ... adicione todos os outros itens aqui
    CadastroTileModel(
        icon: Icons.groups_outlined, title: 'Grupo Aluno', routeName: ''),
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
