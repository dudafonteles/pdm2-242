import 'package:flutter/material.dart';

class EstudanteScreen extends StatelessWidget {
  final List<Map<String, String>> estudantes = [
    {"nome": "Eduarda Fonteles", "periodo": "5º Semestre"},
    {"nome": "Mirela Vale", "periodo": "5º Semestre"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Estudantes')),
      body: ListView.builder(
        itemCount: estudantes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(estudantes[index]['nome']!),
            subtitle: Text(estudantes[index]['periodo']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetailScreen(estudante: estudantes[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class StudentDetailScreen extends StatelessWidget {
  final Map<String, String> estudante;

  StudentDetailScreen({required this.estudante});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes do Estudante')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nome: ${estudante['nome']}', style: TextStyle(fontSize: 22)),
            SizedBox(height: 10),
            Text('Período: ${estudante['periodo']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Voltar para a tela anterior
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
