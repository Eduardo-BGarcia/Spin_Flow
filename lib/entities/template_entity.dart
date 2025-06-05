class TemplateEntity {
  final String id;
  final String name;
  final String? description;
  final String? content;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool isActive;

  TemplateEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.isActive = true,
  });

  @override
  String toString() {
    return 'TemplateEntity(id: $id, name: $name, description: $description, content: $content, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
