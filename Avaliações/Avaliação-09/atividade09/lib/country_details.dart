import 'package:flutter/material.dart';

class CountryDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> country;

  CountryDetailsScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(country['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: country['flag'] != 'N/A'
                  ? Image.network(country['flag'], width: 150, height: 100, fit: BoxFit.cover)
                  : Icon(Icons.flag, size: 100),
            ),
            SizedBox(height: 16),
            Text('Nome: ${country['name']}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Capital: ${country['capital']}', style: TextStyle(fontSize: 16)),
            Text('Região: ${country['region']}', style: TextStyle(fontSize: 16)),
            Text('Subregião: ${country['subregion']}', style: TextStyle(fontSize: 16)),
            Text('População: ${country['population']}', style: TextStyle(fontSize: 16)),
            Text('Moeda: ${country['currency']}', style: TextStyle(fontSize: 16)),
            Text('Línguas: ${country['languages']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
