import 'package:flutter/material.dart';
import 'package:spin_flow/listas/lista_fabricante.dart';
import 'package:spin_flow/configuracao/rotas.dart';
import 'package:spin_flow/telas/cadastro-video-aula.dart';
import 'package:spin_flow/telas/cadastro-fabricante.dart';
import 'package:spin_flow/telas/cadastro-sala.dart';
import 'package:spin_flow/telas/cadastro-tipo-manutencao.dart';
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
        Rotas.cadastroVideoAula: (context) => const FormVideoAula(),
        Rotas.cadastroSala: (context) => const FormSala(),
        Rotas.cadastroTipoManutencao: (context) => const FormTipoManutencao(),
        Rotas.cadastroFabricante: (context) => const FormFabricante(),
        Rotas.listaFabricante: (context) => const ListaFabricante()
      },
    );
  }
}
