class PetAgeModel {
  final int years;
  final int months;

  const PetAgeModel({
    this.years = 0,
    this.months = 0,
  });

  PetAgeModel copyWith({
    int? years,
    int? months,
  }) {
    return PetAgeModel(
      years: years ?? this.years,
      months: months ?? this.months,
    );
  }
}
