import 'package:flutter/material.dart';
import 'package:spin_flow/configuracao/rotas.dart';
import 'package:spin_flow/entities/DTOcadastro.dart';
import 'package:spin_flow/dashboard/widgets/cadastro_tile.dart';

class CadastrosAbas extends StatelessWidget {
  CadastrosAbas({super.key});

  final List<DTOcadastro> _items = [
    DTOcadastro(
        icon: Icons.video_library_outlined,
        title: 'Vídeo Aula',
        routeName: Rotas.videoAulaForm),
    DTOcadastro(
        icon: Icons.person_add_alt_1_outlined,
        title: 'Aluno',
        routeName: Rotas.alunoForm),
    DTOcadastro(
        icon: Icons.business_outlined, title: 'Fabricante', routeName: ''),
    // ... adicione todos os outros itens aqui
    DTOcadastro(
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
