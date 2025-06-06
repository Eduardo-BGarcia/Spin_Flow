import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spin_flow/DTO/DTOfabricante.dart';


class FormFabricante extends StatefulWidget {
  const FormFabricante({super.key});

  @override
  State<FormFabricante> createState() => _FormFabricanteState();
}

class _FormFabricanteState extends State<FormFabricante> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _nomeContatoPrincipalController = TextEditingController();
  final _emailContatoController = TextEditingController();
  final _telefoneContatoController = TextEditingController();
  bool _ativo = true;

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _nomeContatoPrincipalController.dispose();
    _emailContatoController.dispose();
    _telefoneContatoController.dispose();
    super.dispose();
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final DTOFabricante dtoFabricante = DTOFabricante(
        nome: _nomeController.text,
        descricao: _descricaoController.text.isEmpty ? null : _descricaoController.text,
        nome_contato_principal: _nomeContatoPrincipalController.text.isEmpty ? null : _nomeContatoPrincipalController.text,
        email_contato: _emailContatoController.text.isEmpty ? null : _emailContatoController.text,
        telefone_contato: _telefoneContatoController.text.isEmpty ? null : _telefoneContatoController.text,
        ativo: _ativo,
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Dados do Fabricante'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Nome: ${dtoFabricante.nome}'),
                  if (dtoFabricante.descricao != null)
                    Text('Descrição: ${dtoFabricante.descricao}'),
                  if (dtoFabricante.nome_contato_principal != null)
                    Text('Nome Contato Principal: ${dtoFabricante.nome_contato_principal}'),
                  if (dtoFabricante.email_contato != null)
                    Text('Email Contato: ${dtoFabricante.email_contato}'),
                  if (dtoFabricante.telefone_contato != null)
                    Text('Telefone Contato: ${dtoFabricante.telefone_contato}'),
                  Text('Ativo: ${dtoFabricante.ativo ? "Sim" : "Não"}'),
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
        title: const Text('Cadastro de Fabricante'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome* (Nome Fantasia)'),
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
                maxLines: 3,
              ),
              TextFormField(
                controller: _nomeContatoPrincipalController,
                decoration: const InputDecoration(labelText: 'Nome Contato Principal'),
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp(r'\s')),
                ],
                controller: _emailContatoController,
                decoration: const InputDecoration(labelText: 'Email Contato'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value != null && value.isNotEmpty) {
                    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                      return 'Por favor, insira um email válido.';
                    }
                  }
                  return null;
                },
              ),
              TextFormField(
                inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                   	TelefoneInputFormatter()
                ],
                controller: _telefoneContatoController,
                decoration: const InputDecoration(labelText: 'Telefone Contato'),
                keyboardType: TextInputType.phone,
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