import 'package:flutter/material.dart';
import 'api_paises.dart';
import 'country_details.dart'; // Importe a tela de detalhes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Países',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountriesList(),
    );
  }
}

class CountriesList extends StatefulWidget {
  @override
  _CountriesListState createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  Future<List<Map<String, dynamic>>> _countries = Future.value([]);

  @override
  void initState() {
    super.initState();
    _countries = APIPaises().fetchCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Países')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _countries,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 50),
                  SizedBox(height: 10),
                  Text('Erro ao carregar dados', style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum dado encontrado'));
          } else {
            List<Map<String, dynamic>> countries = snapshot.data!;

            return ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                final country = countries[index];

                return Card(
                  child: ListTile(
                    leading: country['flag'] != 'N/A'
                        ? Image.network(country['flag'], width: 50, height: 50, fit: BoxFit.cover)
                        : Icon(Icons.flag),
                    title: Text(country['name']),
                    subtitle: Text('Capital: ${country['capital']}'),
                    trailing: Icon(Icons.arrow_forward), // Ícone indicando navegação
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CountryDetailsScreen(country: country),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
