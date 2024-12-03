enum PetSituation {
  lost(0, 'Perdido'),
  found(1, 'Achado'),
  adoption(2, 'Adoção');

  final int id;
  final String name;

  @override
  String toString() => name;

  const PetSituation(this.id, this.name);
}
