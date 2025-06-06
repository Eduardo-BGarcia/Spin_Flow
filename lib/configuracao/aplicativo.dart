import 'package:flutter/material.dart';
import 'package:spin_flow/configuracao/rotas.dart';
import 'package:spin_flow/telas/dashboard.dart';
import 'package:spin_flow/telas/forms/aluno_form.dart';
import 'package:spin_flow/telas/forms/video_aula_form.dart';

class Aplicativo extends StatelessWidget {
  const Aplicativo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spin Flow",
      theme: ThemeData(colorScheme: const ColorScheme.light()),
      debugShowCheckedModeBanner: false,
      initialRoute: Rotas.home,
      routes: {
        Rotas.home: (context) => const TelaDashboard(),
        Rotas.videoAulaForm: (context) => VideoAulaForm(),
        Rotas.alunoForm: (context) => AlunoForm(),
      },
      home: const TelaDashboard(),
    );
  }
}
