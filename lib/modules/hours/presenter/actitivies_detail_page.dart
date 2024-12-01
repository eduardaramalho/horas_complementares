import 'package:flutter/material.dart';

class ActivitiesDetailPage extends StatelessWidget {
  const ActivitiesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD4D4D4).withOpacity(0.2),
        title: Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/logo-catolica.png',
            height: 60,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'DETALHES DO ALUNO E ATIVIDADE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              _buildDetailItem(
                icon: Icons.category,
                label: 'Categoria',
                value: 'Exercício de monitoria',
              ),
              _buildDetailItem(
                icon: Icons.description,
                label: 'Descrição',
                value: 'Curso Online',
              ),
              _buildDetailItem(
                icon: Icons.person,
                label: 'Nome',
                value: 'Aluno Tal',
              ),
              _buildDetailItem(
                icon: Icons.badge,
                label: 'Matrícula',
                value: 'Aluno Tal',
              ),
              _buildDetailItem(
                icon: Icons.timer,
                label: 'Horas Validando',
                value: '60 horas',
              ),
              _buildDetailItem(
                icon: Icons.comment,
                label: 'Comentários do avaliador',
                value: 'Ok',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF9B1536),
            size: 28,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF9B1536),
                    fontSize: 14,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
