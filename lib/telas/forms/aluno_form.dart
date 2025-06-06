import 'package:flutter/material.dart';
import 'package:spin_flow/enums/generos_enum.dart';
import 'package:spin_flow/utils/data_utils.dart';
import 'package:spin_flow/utils/validation_utils.dart';
import 'package:spin_flow/widgets/components/campo_data.dart';

class AlunoForm extends StatefulWidget {
  const AlunoForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AlunoFormState();
  }
}

class _AlunoFormState extends State<AlunoForm> {
  final _formKey = GlobalKey<FormState>();
  String? _id;
  String? _name;
  String? _email;
  DateTime? _dataNascimento;
  GeneroEnum? _genero;
  String? _telefoneContato;
  String? _perfilInstagram;
  String? _perfilFacebook;
  String? _perfilTiktok;
  bool? _isActive = true;

  DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Aluno'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) => stringValidator(value),
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) => emailValidator(value),
                onSaved: (value) {
                  _email = value;
                },
              ),
              CampoData(
                  label: "Data de Nascimento",
                  dataMaxima: currentDate,
                  dataMinima: DateTime(1900),
                  onChanged: (value) {
                    setState(() {
                      _dataNascimento = value;
                    });
                  },
                  valorInicial: _dataNascimento),
              DropdownButtonFormField<GeneroEnum>(
                decoration: const InputDecoration(labelText: 'Gênero'),
                items: GeneroEnum.dropdownOptions
                    .map(
                      (item) => DropdownMenuItem(
                          value: GeneroEnum.fromValue(item["value"]),
                          child: Text(item['label']!)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _genero = value;
                  });
                },
                validator: (value) => dropdownValidator<GeneroEnum>(value),
              ),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Telefone de Contato'),
                keyboardType: TextInputType.phone,
                validator: (value) => stringValidator(value),
                onSaved: (value) {
                  _telefoneContato = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Instagram'),
                keyboardType: TextInputType.url,
                onSaved: (value) {
                  _perfilInstagram = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Facebook'),
                keyboardType: TextInputType.url,
                onSaved: (value) {
                  _perfilFacebook = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'TikTok'),
                keyboardType: TextInputType.url,
                onSaved: (value) {
                  _perfilTiktok = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  }
                },
                child: const Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
