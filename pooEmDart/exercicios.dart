// Por Matheus Alves de Oliveira Souza




// 1 //



class Produto {
  String nome;
  double preco;

  // Construtor padrão
  Produto(this.nome, this.preco);

  // Construtor nomeado
  Produto.comDesconto(String nome, double preco) : nome = nome, preco = preco * 0.9;
}

void main() {
  // Criando dois objetos
  Produto produto1 = Produto("Camiseta", 50.0);
  Produto produto2 = Produto.comDesconto("Calça", 100.0);

  // Exibindo informações
  print("Produto 1: ${produto1.nome}, Preço: ${produto1.preco}");
  print("Produto 2: ${produto2.nome}, Preço com desconto: ${produto2.preco}");
}




// 2 //



class ContaBancaria {
  String _titular;
  double _saldo;


  ContaBancaria(this._titular, this._saldo);


  String get titular => _titular;
  set titular(String valor) => _titular = valor;


  double get saldo => _saldo;
  set saldo(double valor) {
    if (valor >= 0) {
      _saldo = valor;
    } else {
      print("Saldo não pode ser negativo");
    }
  }
}

void main() {

  ContaBancaria conta = ContaBancaria("João", 500.0);

 
  conta.titular = "Maria";
  conta.saldo = 300.0;

  print("Titular: ${conta.titular}, Saldo: ${conta.saldo}");
}




// 3 //



class Funcionario {
  String _nome;
  double _salario;

  Funcionario(this._nome, double salario) {
    this.salario = salario; 
  }

  String get nome => _nome;
  set nome(String valor) => _nome = valor;


  double get salario => _salario;
  set salario(double valor) {
    if (valor > 0) {
      _salario = valor;
    } else {
      print("Salário deve ser positivo.");
    }
  }
}

void main() {
  
  Funcionario funcionario = Funcionario("Carlos", 2500.0);


  funcionario.salario = -1000.0;  


  print("Funcionario: ${funcionario.nome}, Salário: ${funcionario.salario}");
}



// 4 //



class Aluno {
  String nome;
  double nota1;
  double nota2;

  // Construtor
  Aluno(this.nome, this.nota1, this.nota2);

  // Método para calcular a média
  double calcularMedia() {
    return (nota1 + nota2) / 2;
  }

  // Método para verificar aprovação
  bool estaAprovado() {
    return calcularMedia() >= 6.0;
  }
}

void main() {
  // Criando uma lista de alunos
  List<Aluno> alunos = [
    Aluno("Ana", 7.5, 6.5),
    Aluno("Pedro", 5.0, 4.5),
    Aluno("Lucas", 8.0, 9.0),
  ];

  // Exibindo resultados
  for (var aluno in alunos) {
    print("${aluno.nome} - Média: ${aluno.calcularMedia()} - Aprovado: ${aluno.estaAprovado() ? "Sim" : "Não"}");
  }
}



// 5 //


class Retangulo {
  double _largura;
  double _altura;

  // Construtor
  Retangulo(this._largura, this._altura);

  // Getter e setter para largura
  double get largura => _largura;
  set largura(double valor) {
    if (valor > 0) {
      _largura = valor;
    } else {
      print("Largura deve ser maior que zero.");
    }
  }

  // Getter e setter para altura
  double get altura => _altura;
  set altura(double valor) {
    if (valor > 0) {
      _altura = valor;
    } else {
      print("Altura deve ser maior que zero.");
    }
  }

  // Método para calcular a área
  double calcularArea() {
    return _largura * _altura;
  }
}

void main() {
  // Criando um retângulo
  Retangulo retangulo = Retangulo(5.0, 3.0);

  // Exibindo a área
  print("Área do Retângulo: ${retangulo.calcularArea()}");
}

