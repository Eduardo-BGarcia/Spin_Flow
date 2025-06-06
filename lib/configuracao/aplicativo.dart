import 'package:flutter/material.dart';
import 'package:spin_flow/configuracao/rotas.dart';
import 'package:spin_flow/telas/dashboard.dart';
import 'package:spin_flow/telas/form_tipo_manutencao.dart';
import 'package:spin_flow/telas/form_categoria_musica.dart';

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
        Rotas.tipoManutencao: (context) => const FormTipoManutencao(),
        Rotas.categoriaMusica: (context) => const FormCategoriaMusica(),
      },
      home: const TelaDashboard(),
    );
  }
}
