import 'package:flutter/material.dart';
import 'package:spin_flow/utils/validation_utils.dart';

class VideoAulaForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VideoAulaFormState();
  }
}

class _VideoAulaFormState extends State<VideoAulaForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _linkVideo;
  bool? _isActive = true;

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
                decoration: const InputDecoration(labelText: 'Link do Vídeo'),
                validator: (value) => stringValidator(value),
                onSaved: (value) {
                  _linkVideo = value;
                },
              ),
              SwitchListTile(
                title: const Text('Ativo'),
                value: _isActive ?? true,
                onChanged: (value) {
                  setState(() {
                    _isActive = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aqui você pode salvar os dados ou enviar para o backend
                    print('Nome: $_name, Link do Vídeo: $_linkVideo');
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
