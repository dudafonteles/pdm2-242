import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxWidth: 600), // Largura máxima
                child: Text(
                  'Informações Importantes',
                  style: TextStyle(
                    fontSize: 24, // Tamanho de fonte padrão
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              Container(
                constraints: BoxConstraints(maxWidth: 600), // Largura máxima
                child: Text(
                  'Atividade realizada por Maria Eduarda Fonteles e Mirela Vale Moreira.',
                  style: TextStyle(
                    fontSize: 16, // Tamanho de fonte padrão
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Volta para a tela anterior (HomeScreen)
                },
                child: Text('Voltar para Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Cor do botão
                  foregroundColor: Colors.white, // Cor do texto do botão
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 18), // Tamanho de fonte do botão
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}