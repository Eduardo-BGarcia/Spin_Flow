import 'package:flutter/material.dart';
import 'package:spin_flow/dashboard/abas/aulas_abas.dart';
import 'package:spin_flow/dashboard/abas/cadastro_abas.dart';
import 'package:spin_flow/dashboard/abas/manutencao_abas.dart';
import 'package:spin_flow/dashboard/abas/recados_abas.dart';
import 'package:spin_flow/dashboard/abas/visao_geral_abas.dart';
import 'package:spin_flow/dashboard/widgets/app_drawer.dart';

class DashboardTela extends StatefulWidget {
  const DashboardTela({super.key});

  @override
  State<DashboardTela> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardTela>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      // 1. Usando o widget do Drawer
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(
          'Painel da Professora',
          style: TextStyle(
              color: theme.colorScheme.onSurface, fontWeight: FontWeight.w500),
        ),
        backgroundColor: theme.colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: theme.colorScheme.onSurface),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: theme.colorScheme.primary,
          unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
          indicatorColor: theme.colorScheme.primary,
          indicatorWeight: 2.0,
          tabs: const [
            Tab(icon: Icon(Icons.dashboard_outlined), text: 'Visão Geral'),
            Tab(icon: Icon(Icons.app_registration_outlined), text: 'Cadastros'),
            Tab(icon: Icon(Icons.fitness_center_outlined), text: 'Aulas'),
            Tab(icon: Icon(Icons.build_circle_outlined), text: 'Manutenção'),
            Tab(icon: Icon(Icons.message_outlined), text: 'Recados'),
          ],
        ),
      ),
      // 2. Usando os widgets de cada aba
      body: TabBarView(
        controller: _tabController,
        children: [
          VisaoGeralAbas(),
          CadastrosAbas(),
          AulasAbas(), // Você vai criar este widget
          ManutencaoAbas(), // Você vai criar este widget
          RecadosAbas(), // Você vai criar este widget
        ],
      ),
    );
  }
}
