import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spin_flow/DTO/DTOsala.dart';

class FormSala extends StatefulWidget {
  const FormSala({super.key});

  @override
  State<FormSala> createState() => _FormSalaState();
}

class _FormSalaState extends State<FormSala> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _capacidadeTotalBikesController = TextEditingController();
  final _numeroFilasController = TextEditingController();
  final _numeroBikesPorFilaController = TextEditingController();
  bool _ativo = true;

  @override
  void dispose() {
    _nomeController.dispose();
    _capacidadeTotalBikesController.dispose();
    _numeroFilasController.dispose();
    _numeroBikesPorFilaController.dispose();
    super.dispose();
  }

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final DTOSala dtoSala = DTOSala(
        nome: _nomeController.text,
        capacidade_total_bikes: int.parse(_capacidadeTotalBikesController.text),
        numero_filas: int.parse(_numeroFilasController.text),
        numero_bikes_por_fila: int.parse(_numeroBikesPorFilaController.text),
        ativo: _ativo,
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Dados da Sala'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Nome: ${dtoSala.nome}'),
                  Text('Capacidade Total de Bikes: ${dtoSala.capacidade_total_bikes}'),
                  Text('Número de Filas: ${dtoSala.numero_filas}'),
                  Text('Número de Bikes por Fila: ${dtoSala.numero_bikes_por_fila}'),
                  Text('Ativo: ${dtoSala.ativo ? "Sim" : "Não"}'),
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
        title: const Text('Cadastro de Sala'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: 'Nome*'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O nome é obrigatório.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _capacidadeTotalBikesController,
                decoration: const InputDecoration(labelText: 'Capacidade Total de Bikes*'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'A capacidade total de bikes é obrigatória.';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, insira um número válido.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numeroFilasController,
                decoration: const InputDecoration(labelText: 'Número de Filas*'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O número de filas é obrigatório.';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, insira um número válido.';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _numeroBikesPorFilaController,
                decoration: const InputDecoration(labelText: 'Número de Bikes por Fila*'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'O número de bikes por fila é obrigatório.';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor, insira um número válido.';
                  }
                  return null;
                },
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