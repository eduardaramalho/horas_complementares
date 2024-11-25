import 'package:flutter/material.dart';

class ActitiviesDetailPage extends StatelessWidget {
  const ActitiviesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detalhe de atividade',
          style: TextStyle(fontSize: 18, color: Color(0xFF9B1536)),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            child: Container(
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ]),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text(
                      'DADOS DO ALUNO E ATIVIDADE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                    Text(
                      'Categoria:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Exercício de monitoria:'),
                    Text(
                      'Descrição',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Artigo - GCS'),
                    Text(
                      'Matrícula:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('1205638'),
                    Text(
                      'Nome:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Eduarda Cristina Nunes da Silveira Ramalho'),
                    Text(
                      'Horas validando',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('60'),
                    Text(
                      'Comentários do avaliador:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('Ok'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
