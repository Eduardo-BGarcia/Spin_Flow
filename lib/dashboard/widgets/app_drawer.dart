import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
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
            leading:
                Icon(Icons.home_outlined, color: theme.colorScheme.primary),
            title: Text('Início',
                style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
            onTap: () => Navigator.pushNamed(context, '/home'),
          ),
          ListTile(
            leading:
                Icon(Icons.settings_outlined, color: theme.colorScheme.primary),
            title: Text('Configurações',
                style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
            onTap: () => Navigator.pushNamed(context, '/configuracoes'),
          ),
          const Divider(),
          ListTile(
            leading:
                Icon(Icons.logout_outlined, color: theme.colorScheme.error),
            title:
                Text('Sair', style: TextStyle(color: theme.colorScheme.error)),
            onTap: () => Navigator.pushNamed(context, '/logout'),
          ),
        ],
      ),
    );
  }
}
