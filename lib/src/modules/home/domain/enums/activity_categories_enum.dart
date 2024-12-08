enum ActivityCategoriesEnum {
  scientificProjects(0, 'Participação em projetos de iniciação científica.'),
  technicalVisits(1, 'Visitas técnicas e viagens de estudo não pertencentes aos PE’s das disciplinas do curso.'),
  isolatedCourses(2, 'Disciplinas isoladas em outro curso que complementem sua formação.'),
  socialProjects(3, 'Participação em projetos sociais, atividades comunitárias e acadêmicas.'),
  conferencesAndEvents(4, 'Participação em conferências, palestras e eventos relacionados à área.'),
  thesisDefenses(5, 'Participação como ouvinte em defesas de trabalhos de conclusão.'),
  institutionalResearch(6, 'Participação em pesquisas institucionais.'),
  nonMandatoryInternship(7, 'Estágio Curricular Não Obrigatório.'),
  exchangeTrips(8, 'Viagens de Intercâmbio.');

  final int id;
  final String name;

  const ActivityCategoriesEnum(this.id, this.name);

  static ActivityCategoriesEnum fromId(int id) {
    return ActivityCategoriesEnum.values.firstWhere(
      (element) => element.id == id,
      orElse: () => throw ArgumentError('No ActivityCategoriesEnum with id: $id'),
    );
  }

  @override
  String toString() => name;
}
