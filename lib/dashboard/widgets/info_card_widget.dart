import 'package:flutter/material.dart';
import 'package:spin_flow/dashboard/classes/info_card_classe.dart';


class InfoCardWidget extends StatelessWidget {
  final InfoCardModel model;

  const InfoCardWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(model.icon, size: 40.0, color: model.color),
            const SizedBox(height: 10.0),
            Text(
              model.value,
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              model.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
