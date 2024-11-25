import 'package:flutter/material.dart';
import 'package:horas_complementares/activitie_component.dart';

class ActitiviesPage extends StatefulWidget {
  const ActitiviesPage({super.key});

  @override
  State<ActitiviesPage> createState() => _ActitiviesPageState();
}

class _ActitiviesPageState extends State<ActitiviesPage> {
  final List<Map<String, dynamic>> activities = [
    {
      'title': 'Artigo - GCS',
      'workload': '60hrs',
      'status': 'Aprovado',
      'icon': Icons.check_circle_outline,
      'textColor': const Color(0xFF6AC973),
    },
    {
      'title': 'Curso Java',
      'workload': '30hrs',
      'status': 'Pendente',
      'icon': Icons.schedule_outlined,
      'textColor': const Color(0xFFFFC107),
    },
    {
      'title': 'Projeto Social',
      'workload': '40hrs',
      'status': 'Reprovado',
      'icon': Icons.cancel_outlined,
      'textColor': const Color(0xFFD32F2F),
    },
    {
      'title': 'Seminário',
      'workload': '20hrs',
      'status': 'Aprovado',
      'icon': Icons.check_circle_outline,
      'textColor': const Color(0xFF6AC973),
    },
    {
      'title': 'Curso de Flutter',
      'workload': '20hrs',
      'status': 'Reprovado',
      'icon': Icons.cancel_outlined,
      'textColor': const Color(0xFFD32F2F),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF6AC973),
          onPressed: () {},
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 212, 212, 212).withOpacity(0.2),
        title: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/logo-catolica.png',
            height: 60,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_outline,
                color: Color(0xFF9B1536),
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notification_add_outlined,
                color: Color(0xFF9B1536),
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Bem-vindo ao sistema de avaliações de atividades.'),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Eduarda Cristina Nunes da Silveira Ramalho',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
              shrinkWrap: true,
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ActivitieComponent(
                    title: activity['title'],
                    workload: activity['workload'],
                    status: activity['status'],
                    icon: activity['icon'],
                    textColor: activity['textColor'],
                  ),
                );
              }),
        ],
      ),
      bottomSheet: Container(
        color: const Color(0xFF9B1536),
        height: 50,
        width: double.infinity,
        child: const Center(
          child: Text(
            'Horas necessárias para finalizar: 320 hrs',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
