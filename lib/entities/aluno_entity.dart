import 'package:spin_flow/enums/generos_enum.dart';

class DTOAluno {
  final String id;
  final String name;
  final String email;
  final DateTime dataNascimento;
  final GeneroEnum genero;
  final String telefoneContato;
  final String? perfilInstagram;
  final String? perfilFacebook;
  final String? perfilTiktok;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool isActive;

  DTOAluno({
    required this.id,
    required this.name,
    required this.email,
    required this.dataNascimento,
    required this.genero,
    required this.telefoneContato,
    required this.createdAt,
    this.perfilInstagram,
    this.perfilFacebook,
    this.perfilTiktok,
    this.updatedAt,
    this.deletedAt,
    this.isActive = true,
  });

  @override
  String toString() {
    return 'AlunoEntity(id: $id, name: $name, email: $email, dataNascimento: $dataNascimento, genero: $genero, telefoneContato: $telefoneContato, perfilInstagram: $perfilInstagram, perfilFacebook: $perfilFacebook, perfilTiktok: $perfilTiktok, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isActive: $isActive)';
  }
}
