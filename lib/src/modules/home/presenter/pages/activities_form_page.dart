import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../domain/enums/activity_categories_enum.dart';
import '../controllers/activities_form_controller.dart';
import '../controllers/states/activities_form_content_state.dart';

class ActivitiesFormPage extends StatefulWidget {
  final ActivitiesFormController controller;

  const ActivitiesFormPage({super.key, required this.controller});

  @override
  State<ActivitiesFormPage> createState() => _ActivitiesFormPageState();
}

class _ActivitiesFormPageState extends State<ActivitiesFormPage> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _categories = [
    'Participação em projetos de iniciação científica.',
    'Visitas técnicas e viagens de estudo não pertencentes aos PE’s das disciplinas do curso.',
    'Disciplinas isoladas em outro curso que complementem sua formação.',
    'Participação em projetos sociais, atividades comunitárias e acadêmicas.',
    'Participação em conferências, palestras e eventos relacionados à área.',
    'Participação como ouvinte em defesas de trabalhos de conclusão.',
    'Participação em pesquisas institucionais.',
    'Estágio Curricular Não Obrigatório.',
    'Viagens de Intercâmbio.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/logo-catolica.png',
              height: 50,
            ),
          ],
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
              const Center(
                child: Text(
                  'NOVA ATIVIDADE COMPLEMENTAR',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              CatolicaTextFormField(
                label: 'Nome da atividade:',
                hint: 'Digite o nome da atividade',
                initialValue: ActivitiesFormContentState.name,
                onChanged: ActivitiesFormContentState.setName,
              ),
              const SizedBox(height: 16),
              Text(
                'Quantidade de horas:',
                style: context.texts.paragraphMedium,
              ),
              const SizedBox(height: 8),
              ValueListenableBuilder(
                valueListenable: ActivitiesFormContentState.workload,
                builder: (context, workload, child) {
                  return CatolicaCounterField(
                    value: workload,
                    onChanged: ActivitiesFormContentState.setWorkload,
                  );
                },
              ),
              const SizedBox(height: 16),
              CatolicaDropdownField(
                label: 'Categoria',
                hint: 'Selecione uma categoria',
                items: ActivityCategoriesEnum.values,
                initialValue: ActivitiesFormContentState.category,
                onChanged: ActivitiesFormContentState.setCategory,
              ),
              const SizedBox(height: 16),
              CatolicaTextFormField(
                label: 'Descrição da atividade:',
                hint: 'Digite uma descrição para a atividade',
                initialValue: ActivitiesFormContentState.name,
                onChanged: ActivitiesFormContentState.setName,
                maxLength: 300,
                hasCounter: true,
              ),
              const SizedBox(height: 16),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.upload_file,
                        size: 40,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Fazer upload de certificado',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CatolicaPrimaryButton(
                label: 'ENVIAR PROJETO PARA REVISÃO',
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Projeto enviado para revisão'),
                      ),
                    );
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
