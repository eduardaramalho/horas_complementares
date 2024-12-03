import 'package:flutter/material.dart';

import '../../../../core/contracts/app_notifier.dart';
import '../../data/enums/pet_situation_enum.dart';
import '../../data/enums/pet_species_enum.dart';
import '../../data/models/pet_age_model.dart';
import 'states/pet_form_state.dart';

class PetFormController extends AppNotifier<PetFormState> {
  PetFormController() : super(LoadingPetFormState());

  Future<void> init() async {
    setState(LoadingPetFormState());

    await Future.delayed(const Duration(seconds: 1));

    setState(LoadedPetFormState());
  }

  Future<void> create() async {
    setState(SendingPetFormState());

    await Future.delayed(const Duration(seconds: 3));

    setState(SuccessPetFormState());
  }

  String name = '';
  void setName(String value) => name = value;

  String description = '';
  void setDescription(String value) => description = value;

  PetSpecies? specie;
  void setSpecie(PetSpecies value) => specie = value;

  PetSituation? situation;
  void setSituation(PetSituation value) => situation = value;

  final ValueNotifier<PetAgeModel> petAgeModel = ValueNotifier<PetAgeModel>(const PetAgeModel());
  void setPetAgeModel(PetAgeModel value) => petAgeModel.value = value;
}
