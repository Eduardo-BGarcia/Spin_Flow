import 'package:flutter/material.dart';
import 'package:spin_flow/configuracao/rotas.dart';
import 'package:spin_flow/telas/cadastro-sala.dart';
import 'package:spin_flow/dashboard/tela/dashboard_tela.dart';

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
        Rotas.home: (context) => const DashboardTela(),
        Rotas.cadastroSala: (context) => const FormSala(),
      },
      home: const DashboardTela(),
    );
  }
}
