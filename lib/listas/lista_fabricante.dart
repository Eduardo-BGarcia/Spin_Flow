import 'package:flutter/material.dart';
import 'package:spin_flow/DTO/DTOfabricante.dart';
import 'package:spin_flow/configuracao/rotas.dart'; // Ajuste o caminho se necessário

// Mock de dados de fabricantes de spinning
final List<DTOFabricante> mockFabricantes = [
  DTOFabricante(
    id: 'fab001',
    nome: 'SpinLife Bikes',
    descricao: 'Líder em bicicletas de spinning de alta performance para academias.',
    nome_contato_principal: 'Carlos Silva',
    email_contato: 'carlos.silva@spinlife.com',
    telefone_contato: '(11) 98765-4321',
    ativo: true,
  ),
  DTOFabricante(
    id: 'fab002',
    nome: 'ProCycle Solutions',
    descricao: 'Fabricante de bicicletas indoor com foco em durabilidade e tecnologia.',
    nome_contato_principal: 'Ana Pereira',
    email_contato: 'ana.pereira@procycle.com',
    telefone_contato: '(21) 91234-5678',
    ativo: true,
  ),
  DTOFabricante(
    id: 'fab003',
    nome: 'Studio Spin Equipamentos',
    descricao: 'Equipamentos para estúdios de spinning, design moderno e robusto.',
    nome_contato_principal: 'Mariana Costa',
    email_contato: 'mariana.costa@studiospin.com.br',
    telefone_contato: '(31) 99999-8888',
    ativo: false, // Exemplo de fabricante inativo
  ),
  DTOFabricante(
    id: 'fab004',
    nome: 'FitBike Brasil',
    descricao: 'Bicicletas de spinning com ótimo custo-benefício para o mercado nacional.',
    nome_contato_principal: 'João Santos',
    email_contato: 'joao.santos@fitbikebr.com',
    telefone_contato: '(41) 98877-6655',
    ativo: true,
  ),
];

class ListaFabricante extends StatefulWidget {
  const ListaFabricante({super.key});

  @override
  State<ListaFabricante> createState() => _ListaFabricanteState();
}

class _ListaFabricanteState extends State<ListaFabricante> {
  // No futuro, esta lista viria do banco de dados (sqflite)
  late List<DTOFabricante> _fabricantes;

  @override
  void initState() {
    super.initState();
    // Inicializa com o mock de dados
    _fabricantes = List.from(mockFabricantes);
  }

  void _alterarFabricante(DTOFabricante fabricante) {
    // Simula a navegação para uma tela de edição ou abre um dialog de edição
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alterar Fabricante: ${fabricante.nome}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('ID: ${fabricante.id ?? "N/A"}'),
                Text('Nome: ${fabricante.nome}'),
                if (fabricante.descricao != null)
                  Text('Descrição: ${fabricante.descricao}'),
                if (fabricante.nome_contato_principal != null)
                  Text('Contato: ${fabricante.nome_contato_principal}'),
                if (fabricante.email_contato != null)
                  Text('Email: ${fabricante.email_contato}'),
                if (fabricante.telefone_contato != null)
                  Text('Telefone: ${fabricante.telefone_contato}'),
                Text('Ativo: ${fabricante.ativo ? "Sim" : "Não"}'),
                // Aqui você poderia adicionar TextFormFields para edição
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Salvar Alterações'),
              onPressed: () {
                // Lógica para salvar as alterações (ex: atualizar no banco e no estado)
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Fabricante ${fabricante.nome} alterado (simulação).')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _excluirFabricante(DTOFabricante fabricante) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Exclusão'),
          content: Text('Tem certeza que deseja excluir o fabricante "${fabricante.nome}"? Esta ação não poderá ser desfeita.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Excluir'),
              onPressed: () {
                // Lógica para excluir o fabricante do banco de dados
                setState(() {
                  _fabricantes.removeWhere((f) => f.id == fabricante.id);
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Fabricante ${fabricante.nome} excluído (simulação).')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Fabricantes'),
      ),
      body: _fabricantes.isEmpty
          ? const Center(child: Text('Nenhum fabricante cadastrado.'))
          : ListView.builder(
              itemCount: _fabricantes.length,
              itemBuilder: (context, index) {
                final fabricante = _fabricantes[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    title: Text(fabricante.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (fabricante.descricao != null && fabricante.descricao!.isNotEmpty)
                          Text(fabricante.descricao!, maxLines: 2, overflow: TextOverflow.ellipsis),
                        if (fabricante.nome_contato_principal != null && fabricante.nome_contato_principal!.isNotEmpty)
                          Text('Contato: ${fabricante.nome_contato_principal}'),
                        Text('Status: ${fabricante.ativo ? "Ativo" : "Inativo"}', style: TextStyle(color: fabricante.ativo ? Colors.green : Colors.grey)),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.orange),
                          tooltip: 'Alterar',
                          onPressed: () => _alterarFabricante(fabricante),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          tooltip: 'Excluir',
                          onPressed: () => _excluirFabricante(fabricante),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Poderia abrir uma tela de detalhes do fabricante
                      _alterarFabricante(fabricante);
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Rotas.cadastroFabricante); // Rota para a tela de cadastro de fabricante
        },
        tooltip: 'Adicionar Fabricante',
        child: const Icon(Icons.add),
      ),
    );
  }
}