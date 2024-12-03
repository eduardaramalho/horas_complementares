import 'package:flutter/material.dart';

class ActivitiesFormPage extends StatefulWidget {
  const ActivitiesFormPage({super.key});

  @override
  State<ActivitiesFormPage> createState() => _ActivitiesFormPageState();
}

class _ActivitiesFormPageState extends State<ActivitiesFormPage> {
  int? _selectedCategory;
  final _formKey = GlobalKey<FormState>();
  final _hoursController = TextEditingController();

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
              'assets/logo-catolica.png',
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
              )),
              const SizedBox(height: 16),
              TextFormField(
                controller: _hoursController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Carga horária:',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Categoria',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Column(
                children: _categories
                    .asMap()
                    .entries
                    .map((entry) => RadioListTile<int>(
                          title: Text(entry.value),
                          value: entry.key,
                          groupValue: _selectedCategory,
                          onChanged: (int? value) {
                            setState(() {
                              _selectedCategory = value;
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Descrição:',
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
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
              const SizedBox(height: 16),
              Center(
                child: InkWell(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Projeto enviado para revisão')),
                      );
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF159B1E),
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'ENVIAR PROJETO PARA REVISÃO',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
