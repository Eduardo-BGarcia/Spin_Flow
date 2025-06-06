import 'package:flutter/material.dart';
import 'package:spin_flow/entities/DTOInfoCard.dart';
import 'package:spin_flow/dashboard/widgets/info_card_widget.dart';

class VisaoGeralAbas extends StatelessWidget {
  VisaoGeralAbas({super.key});

  // Os dados agora vivem aqui, separados da UI principal
  final List<DTOInfoCard> _cards = [
    DTOInfoCard(
        icon: Icons.message_outlined,
        value: '3',
        title: 'Recados',
        color: Colors.orange.shade700),
    DTOInfoCard(
        icon: Icons.people_alt_outlined,
        value: '82',
        title: 'Alunos Ativos',
        color: Colors.blue.shade700),
    DTOInfoCard(
        icon: Icons.schedule_outlined,
        value: '12',
        title: 'Aulas Agendadas',
        color: Colors.green.shade700),
    DTOInfoCard(
        icon: Icons.music_note_outlined,
        value: '4',
        title: 'Mix de Músicas',
        color: Colors.purple.shade700),
    DTOInfoCard(
        icon: Icons.directions_bike_outlined,
        value: '18',
        title: 'Bikes OK',
        color: Colors.teal.shade700),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        childAspectRatio: 1.1,
      ),
      padding: const EdgeInsets.all(16.0),
      itemCount: _cards.length,
      itemBuilder: (context, index) {
        return InfoCardWidget(model: _cards[index]);
      },
    );
  }
}
