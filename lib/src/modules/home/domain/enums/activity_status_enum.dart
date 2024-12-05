enum ActivityStatusEnum {
  pending(0, 'Pendente'),
  aproved(1, 'Aprovado'),
  reproved(2, 'Reprovado');

  final int id;
  final String name;

  static ActivityStatusEnum fromId(int id) {
    return ActivityStatusEnum.values.firstWhere((element) => element.id == id);
  }

  @override
  String toString() => name;

  const ActivityStatusEnum(this.id, this.name);
}
