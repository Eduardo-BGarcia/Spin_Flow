Estrututa das pastas do Dashboard

lib/
└── features/  --> esse não existe, achei melhor sem;
    └── dashboard/
        ├── modelo/
        │   ├── info_card_modelo.dart
        │   └── cadastro_tile_modelo.dart
        ├── tela/
        │   └── tela.dart (o seu arquivo principal, agora limpo)
        ├── widgets/
        │   ├── app_drawer.dart
        │   ├── cadastro_tile.dart
        │   └── info_card_widget.dart
        └── abas/
            ├── aulas_abas.dart
            ├── cadastros_abas.dart
            ├── manutencao_abas.dart
            ├── recados_abas.dart
            └── visao_geral_abas.dart