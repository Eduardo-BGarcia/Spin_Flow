import 'package:flutter/material.dart';
import 'package:spin_flow/DTO/DTOTipoManutencao.dart';

class FormTipoManutencao extends StatefulWidget {
  const FormTipoManutencao({super.key});

  @override
  State<FormTipoManutencao> createState() => _FormTipoManutencaoState();
}

class _FormTipoManutencaoState extends State<FormTipoManutencao> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  bool _ativo = true;

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    super.dispose();
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final DTOTipoManutencao dtoTipoManutencao = DTOTipoManutencao(
        nome: _nomeController.text,
        descricao: _descricaoController.text.isEmpty ? null : _descricaoController.text,
        ativo: _ativo,
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Dados do Tipo de Manutenção'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Nome: ${dtoTipoManutencao.nome}'),
                  if (dtoTipoManutencao.descricao != null)
                    Text('Descrição: ${dtoTipoManutencao.descricao}'),
                  Text('Ativo: ${dtoTipoManutencao.ativo ? "Sim" : "Não"}'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Tipo de Manutenção'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome*', hintText: "Preventiva, Corretiva, Limpeza"),
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O nome é obrigatório.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                maxLines: 3, // Para campos de texto maiores
              ),
              SwitchListTile(
                title: const Text('Ativo*'),
                value: _ativo,
                onChanged: (bool value) {
                  setState(() {
                    _ativo = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvar,
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}