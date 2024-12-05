enum ActivityCategoriesEnum {
  category0(0, 'Categoria 0'),
  category1(1, 'Categoria 1'),
  category2(2, 'Categoria 2');

  final int id;
  final String name;

  static ActivityCategoriesEnum fromId(int id) {
    return ActivityCategoriesEnum.values.firstWhere((element) => element.id == id);
  }

  @override
  String toString() => name;

  const ActivityCategoriesEnum(this.id, this.name);
}
