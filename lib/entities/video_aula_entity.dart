class DTOVideoAula {
  final String id;
  final String name;
  final String linkVideo;

  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final bool isActive;

  DTOVideoAula({
    required this.id,
    required this.name,
    required this.linkVideo,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.isActive = true,
  });

  @override
  String toString() {
    return 'VideoAulaEntity(id: $id, name: $name, linkVideo: $linkVideo, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, isActive: $isActive)';
  }
}
