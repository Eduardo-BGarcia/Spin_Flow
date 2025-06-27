import 'package:flutter/material.dart';
import 'package:spin_flow/DTO/DTOVideoAula.dart';

class FormVideoAula extends StatefulWidget {
  const FormVideoAula({super.key});

  @override
  State<FormVideoAula> createState() => _FormVideoAulaState();
}

class _FormVideoAulaState extends State<FormVideoAula> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _dia_aulaController = TextEditingController();
  final _hora_aulaController = TextEditingController();
  final _urlController = TextEditingController();
  bool _ativo = true;

  @override
  void dispose() {
    _nomeController.dispose();
    _descricaoController.dispose();
    _dia_aulaController.dispose();
    _hora_aulaController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final DTOVideoAula dtoVideoAula = DTOVideoAula(
        id: '',
        nome: _nomeController.text,
        descricao: _descricaoController.text.isEmpty
            ? null
            : _descricaoController.text,
        dia_aula: _dia_aulaController.text,
        hora_aula: _hora_aulaController.text,
        url: _urlController.text,
        ativo: _ativo,
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Dados da Video Aula'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Nome: ${dtoVideoAula.nome}'),
                  if (dtoVideoAula.descricao != null)
                    Text('Descrição: ${dtoVideoAula.descricao}'),
                  Text('Data da Aula: ${dtoVideoAula.dia_aula}'),
                  Text('Hora da Aula: ${dtoVideoAula.hora_aula}'),
                  Text('Ativo: ${dtoVideoAula.ativo ? "Sim" : "Não"}'),
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
        title: const Text('Cadastro de Video Aula'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                    labelText: 'Nome*',
                    hintText: "Alguma coisa1, Alguma coisa 2, Alguma coisa 3"),
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
