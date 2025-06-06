import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CampoData extends StatefulWidget {
  final String label;
  final void Function(DateTime)? onChanged;
  final DateTime? valorInicial;
  final DateTime? dataMinima;
  final DateTime? dataMaxima;

  const CampoData({
    super.key,
    required this.label,
    this.onChanged,
    this.valorInicial,
    this.dataMinima,
    this.dataMaxima,
  });

  @override
  State<CampoData> createState() => _CampoDataState();
}

class _CampoDataState extends State<CampoData> {
  final _controller = TextEditingController();
  DateTime? _dataSelecionada;

  @override
  void initState() {
    super.initState();
    if (widget.valorInicial != null) {
      _dataSelecionada = widget.valorInicial;
      _controller.text = DateFormat('dd/MM/yyyy').format(widget.valorInicial!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: const Icon(Icons.calendar_today),
      ),
      onTap: () async {
        final DateTime agora = DateTime.now();
        final primeira = DateTime(1900);
        final ultima = DateTime(agora.year + 1);
        final inicial = _dataSelecionada ?? agora;

        final DateTime? data = await showDatePicker(
          context: context,
          initialDate: inicial,
          firstDate: widget.dataMinima ?? primeira,
          lastDate: widget.dataMaxima ?? ultima,
        );

        if (data != null) {
          setState(() {
            _dataSelecionada = data;
            _controller.text = DateFormat('dd/MM/yyyy').format(data);
          });
          if (widget.onChanged != null) {
            widget.onChanged!(data);
          }
        }
      },
    );
  }
}
