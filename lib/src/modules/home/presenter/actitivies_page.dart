import 'package:flutter/material.dart';

import 'widgets/activitie_component.dart';

class ActitiviesPage extends StatefulWidget {
  const ActitiviesPage({super.key});

  @override
  State<ActitiviesPage> createState() => _ActitiviesPageState();
}

class _ActitiviesPageState extends State<ActitiviesPage> {
  final List<Map<String, dynamic>> activities = [
    {
      'title': 'Artigo - GCS',
      'workload': '60',
      'status': 'Aprovado',
      'icon': Icons.check_circle_outline,
      'textColor': const Color(0xFF6AC973),
    },
    {
      'title': 'Curso Java',
      'workload': '30',
      'status': 'Pendente',
      'icon': Icons.schedule_outlined,
      'textColor': const Color(0xFFFFC107),
    },
    {
      'title': 'Projeto Social',
      'workload': '40',
      'status': 'Reprovado',
      'icon': Icons.cancel_outlined,
      'textColor': const Color(0xFFD32F2F),
    },
    {
      'title': 'Seminário',
      'workload': '20',
      'status': 'Aprovado',
      'icon': Icons.check_circle_outline,
      'textColor': const Color(0xFF6AC973),
    },
    {
      'title': 'Curso de Flutter',
      'workload': '20',
      'status': 'Reprovado',
      'icon': Icons.cancel_outlined,
      'textColor': const Color(0xFFD32F2F),
    },
    {
      'title': 'Curso de Flutter',
      'workload': '20',
      'status': 'Reprovado',
      'icon': Icons.cancel_outlined,
      'textColor': const Color(0xFFD32F2F),
    },
    {
      'title': 'Curso de Flutter',
      'workload': '20',
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
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const ActivitiesFormPage()),
          // );
        },
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFD4D4D4).withOpacity(0.2),
        title: Align(
          child: Image.asset(
            'assets/logo-catolica.png',
            height: 60,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const UserProfilePage(),
              //   ),
              // );
            },
            icon: const Icon(
              Icons.person_outline,
              color: Color(0xFF9B1536),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bem-vindo, Aluno!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Essas são as suas atitividades complementares.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ActivitieComponent(
                    title: activity['title'],
                    workload: activity['workload'],
                    status: activity['status'],
                    icon: activity['icon'],
                    textColor: activity['textColor'],
                  ),
                );
              },
            ),
          ],
        ),
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
