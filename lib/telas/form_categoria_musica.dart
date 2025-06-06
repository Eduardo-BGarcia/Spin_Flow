import 'package:flutter/material.dart';
import '../entities/categoria_musica.dart';

class FormCategoriaMusica extends StatefulWidget {
  const FormCategoriaMusica({super.key});

  @override
  State<FormCategoriaMusica> createState() => _FormCategoriaMusicaState();
}

class _FormCategoriaMusicaState extends State<FormCategoriaMusica> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  bool _ativo = true;

  void _salvar() {
    if (_formKey.currentState!.validate()) {
      final dto = DTOCategoriaMusica(
        nome: _nomeController.text.trim(),
        descricao: _descricaoController.text.trim().isEmpty ? null : _descricaoController.text.trim(),
        ativo: _ativo,
      );
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Dados salvos'),
          content: Text(dto.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categoria de Música'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome*',
                  hintText: 'Ex: Cadência, Coordenação, Força...',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'O nome é obrigatório.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  hintText: 'Descreva a categoria (opcional)',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Ativo'),
                value: _ativo,
                onChanged: (value) {
                  setState(() {
                    _ativo = value;
                  });
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _salvar,
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
