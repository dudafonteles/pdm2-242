import 'dart:convert';

// Classe Dependente - parte da agregação
class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  // Método para converter o objeto Dependente para JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
    };
  }
}

// Classe Funcionario - tem Dependentes (Agregação)
class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  // Método para converter o objeto Funcionario para JSON
  Map<String, dynamic> toJson() {
    return {
      'nome': _nome,
      'dependentes': _dependentes.map((dependente) => dependente.toJson()).toList(),
    };
  }
}

// Classe EquipeProjeto - tem Funcionarios (Composição)
class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeProjeto,List <Funcionario> funcionarios) {
    _nomeProjeto = nomeProjeto;
    _funcionarios = funcionarios;
  }

  // Método para converter o objeto EquipeProjeto para JSON
  Map<String, dynamic> toJson() {
    return {
      'nomeProjeto': _nomeProjeto,
      'funcionarios': _funcionarios.map((funcionario) => funcionario.toJson()).toList(),
    };
  }
}

void main() {
  // 1. Criar vários objetos Dependentes
  var dependente1 = Dependente('Alfred');
  var dependente2 = Dependente('Meridth');
  var dependente3 = Dependente('Natasha');

  // 2. Criar vários objetos Funcionario
  var funcionario1 = Funcionario('Carlos', [dependente1, dependente2]);
  var funcionario2 = Funcionario('Roberta', [dependente3]);

  // 3. Associar os Dependentes criados aos respectivos Funcionarios
  // (feito diretamente na criação dos funcionários)

  // 4. Criar uma lista de Funcionarios
  var funcionarios = [funcionario1, funcionario2];

  // 5. Criar um objeto EquipeProjeto chamando o método construtor
  // que dá nome ao projeto e insere a coleção de funcionarios
  var equipe = EquipeProjeto('Projeto X', funcionarios);

  // 6. Printar no formato JSON o objeto EquipeProjeto
  var equipeJson = jsonEncode(equipe.toJson());
  print(equipeJson);
}

