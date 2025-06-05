import 'package:flutter/material.dart';

class TelaDashboard extends StatefulWidget {
  const TelaDashboard({super.key});

  @override
  State<TelaDashboard> createState() => _TelaDashboardState();
}

class _TelaDashboardState extends State<TelaDashboard>
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

  // --- Componentes Locais ---

  /// Cria um cartão de informação para a Visão Geral.
  Widget _infoCard({
    required IconData icon,
    required String value,
    required String title,
    required Color color, // Mantida para diferenciação, mas pode ser padronizada
  }) {
    return Card(
      elevation: 2.0, // Elevação sutil
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Bordas mais suaves
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 40.0, color: color), // Ícone um pouco menor
            const SizedBox(height: 10.0),
            Text(
              value,
              style: TextStyle(
                fontSize: 26.0, // Fonte ligeiramente menor
                fontWeight: FontWeight.w600, // Peso médio
                color: Theme.of(context).textTheme.titleLarge?.color,
              ),
            ),
            const SizedBox(height: 6.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0, // Fonte menor para o título
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Cria um item de lista clicável para as seções.
  Widget _cadastroTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).textTheme.bodyLarge?.color),
      ),
      onTap: onTap,
      // trailing: const Icon(Icons.arrow_forward_ios, size: 16.0), // Removido para minimalismo
    );
  }

  // --- Seções das Abas ---
  Widget _buildSeparatedListView(List<Widget> children) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) => Divider(
        height: 1,
        thickness: 1,
        color: Colors.grey[200],
      ),
    );
  }

  /// Conteúdo da aba 'Visão Geral'.
  Widget _visaoGeral() {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16.0),
      mainAxisSpacing: 12.0, // Espaçamento ajustado
      crossAxisSpacing: 12.0, // Espaçamento ajustado
      childAspectRatio: 1.1, // Ajuste para proporção
      children: [
        _infoCard(
          icon: Icons.message_outlined, // Ícones Outlined para um look mais leve
          value: '3',
          title: 'Recados',
          color: Colors.orange.shade700,
        ),
        _infoCard(
          icon: Icons.people_alt_outlined,
          value: '82',
          title: 'Alunos Ativos',
          color: Colors.blue.shade700,
        ),
        _infoCard(
          icon: Icons.schedule_outlined,
          value: '12',
          title: 'Aulas Agendadas',
          color: Colors.green.shade700,
        ),
        _infoCard(
          icon: Icons.music_note_outlined,
          value: '4',
          title: 'Mix de Músicas',
          color: Colors.purple.shade700,
        ),
        _infoCard(
          icon: Icons.directions_bike_outlined,
          value: '18',
          title: 'Bikes OK',
          color: Colors.teal.shade700,
        ),
      ],
    );
  }

  /// Conteúdo da aba 'Cadastros'.
  Widget _cadastros() {
    return _buildSeparatedListView([
      _cadastroTile(
          icon: Icons.video_library_outlined,
          title: 'Vídeo Aula',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.person_add_alt_1_outlined,
          title: 'Aluno',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.business_outlined,
          title: 'Fabricante',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.meeting_room_outlined,
          title: 'Sala',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.build_outlined,
          title: 'Tipo Manutenção',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.library_music_outlined,
          title: 'Categoria Música',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.group_work_outlined,
          title: 'Banda/Artista',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.class_outlined,
          title: 'Turma',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.directions_bike_outlined,
          title: 'Bike',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.music_note_outlined,
          title: 'Música',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.playlist_play_outlined,
          title: 'Mix Aula (Playlist)',
          onTap: () => Navigator.pushNamed(context, '')),
      _cadastroTile(
          icon: Icons.groups_outlined,
          title: 'Grupo Aluno',
          onTap: () => Navigator.pushNamed(context, '')),
    ]);
  }

  /// Conteúdo da aba 'Aulas'.
  Widget _aulasEAuloes() {
    return _buildSeparatedListView([
      _cadastroTile(
          icon: Icons.schedule_outlined,
          title: 'Agendar Aula',
          onTap: () => Navigator.pushNamed(context, '/agendar-aula')),
      _cadastroTile(
          icon: Icons.event_outlined,
          title: 'Gerenciar Aulões',
          onTap: () => Navigator.pushNamed(context, '/gerenciar-auloes')),
    ]);
  }

  /// Conteúdo da aba 'Manutenção'.
  Widget _manutencao() {
    return _buildSeparatedListView([
      _cadastroTile(
          icon: Icons.build_circle_outlined,
          title: 'Registrar Manutenção',
          onTap: () => Navigator.pushNamed(context, '/registrar-manutencao')),
      _cadastroTile(
          icon: Icons.history_outlined,
          title: 'Histórico de Manutenções',
          onTap: () => Navigator.pushNamed(context, '/historico-manutencao')),
    ]);
  }

  /// Conteúdo da aba 'Recados'.
  Widget _recados() {
    return _buildSeparatedListView([
      _cadastroTile(
          icon: Icons.add_comment_outlined,
          title: 'Enviar Novo Recado',
          onTap: () => Navigator.pushNamed(context, '/enviar-recado')),
      _cadastroTile(
          icon: Icons.archive_outlined,
          title: 'Recados Arquivados',
          onTap: () => Navigator.pushNamed(context, '/recados-arquivados')),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.surface, // Fundo mais claro
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: theme.colorScheme.primaryContainer, // Cor mais suave
              ),
              child: Text(
                'Menu Principal',
                style: TextStyle(
                  color: theme.colorScheme.onPrimaryContainer,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined, color: theme.colorScheme.primary),
              title: Text('Início', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              onTap: () => Navigator.pushNamed(context, '/home'),
            ),
            ListTile(
              leading: Icon(Icons.settings_outlined, color: theme.colorScheme.primary),
              title: Text('Configurações', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
              onTap: () => Navigator.pushNamed(context, '/configuracoes'),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.logout_outlined, color: theme.colorScheme.error),
              title: Text('Sair', style: TextStyle(color: theme.colorScheme.error)),
              onTap: () => Navigator.pushNamed(context, '/logout'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Painel da Professora',
          style: TextStyle(
              color: theme.colorScheme.onSurface, fontWeight: FontWeight.w500),
        ),
        backgroundColor: theme.colorScheme.surface, // AppBar com a cor de fundo
        elevation: 0, // Sem sombra para um visual mais plano
        iconTheme: IconThemeData(color: theme.colorScheme.onSurface), // Cor do ícone do drawer
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
      body: TabBarView(
        controller: _tabController,
        children: [
          _visaoGeral(),
          _cadastros(),
          _aulasEAuloes(),
          _manutencao(),
          _recados(),
        ],
      ),
    );
  }
}