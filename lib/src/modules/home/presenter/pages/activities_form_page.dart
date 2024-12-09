import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../core/mixins/validators/required_field_validator_mixin.dart';
import '../../../../core/routes/custom_navigator.dart';
import '../../domain/enums/activity_categories_enum.dart';
import '../controllers/activities_form_controller.dart';
import '../controllers/states/activities_form_content_state.dart';
import '../resources/activities_form_resources.dart';
import '../widgets/pick_pdf_widget.dart';

class ActivitiesFormPage extends StatefulWidget {
  final ActivitiesFormController controller;

  const ActivitiesFormPage({super.key, required this.controller});

  @override
  State<ActivitiesFormPage> createState() => _ActivitiesFormPageState();
}

class _ActivitiesFormPageState extends State<ActivitiesFormPage> with RequiredFieldValidatorMixin {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    widget.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ActivitiesFormResources.title,
          style: context.texts.headingH6.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              CatolicaTextFormField(
                label: ActivitiesFormResources.activityNameLabel,
                hint: ActivitiesFormResources.activityNameHint,
                initialValue: ActivitiesFormContentState.name,
                onChanged: ActivitiesFormContentState.setName,
                isRequired: true,
                validator: isValidRequiredField,
              ),
              const SizedBox(height: 16),
              Text(
                ActivitiesFormResources.workloadLabel,
                style: context.texts.paragraphMedium,
              ),
              const SizedBox(height: 8),
              ValueListenableBuilder(
                valueListenable: ActivitiesFormContentState.workload,
                builder: (context, workload, child) {
                  return CatolicaCounterField(
                    value: workload,
                    onChanged: ActivitiesFormContentState.setWorkload,
                    validator: (value) {
                      if (value < 1) return ActivitiesFormResources.workloadMustBeHigherThanZero;

                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 16),
              CatolicaDropdownField(
                label: ActivitiesFormResources.categoryLabel,
                hint: ActivitiesFormResources.categoryHint,
                items: ActivityCategoriesEnum.values,
                initialValue: ActivitiesFormContentState.category,
                onChanged: ActivitiesFormContentState.setCategory,
                isRequired: true,
                validator: isValidRequiredField,
              ),
              const SizedBox(height: 16),
              CatolicaTextFormField(
                label: ActivitiesFormResources.descriptionLabel,
                hint: ActivitiesFormResources.descriptionHint,
                initialValue: ActivitiesFormContentState.description,
                onChanged: ActivitiesFormContentState.setDescription,
                maxLength: 300,
                hasCounter: true,
                isRequired: true,
                validator: isValidRequiredField,
              ),
              const SizedBox(height: 16),
              PickPdfWidget(
                initialFile: ActivitiesFormContentState.file,
                onPickPdf: ActivitiesFormContentState.setFile,
              ),
              const SizedBox(height: 32),
              CatolicaPrimaryButton(
                label: ActivitiesFormResources.sendToReviewButton,
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    await widget.controller.createActivity().then((_) {
                      CustomNavigator.of(context).pop(true);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(ActivitiesFormResources.sentToReviewMessage),
                        ),
                      );
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
