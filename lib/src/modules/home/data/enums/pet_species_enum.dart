enum PetSpecies {
  dog(0, 'Cachorro'),
  cat(1, 'Gato'),
  other(2, 'Outros');

  final int id;
  final String name;

  @override
  String toString() => name;

  const PetSpecies(this.id, this.name);
}
