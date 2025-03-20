import 'dart:io';

void main() {
  bool executando = true;
  
  while (executando) {
   
    print('\n===== MENU INTERATIVO =====');
    print('1️ Exibir "Olá, Dart!"');
    print('2️ Calcular a área de um retângulo');
    print('3️ Verificar se um número é par ou ímpar');
    print('4️4 Comparar dois números');
    print('5️ Converter nota para conceito');
    print('6️ Exibir contagem progressiva');
    print('7️ Somar todos os números até um valor especificado');
    print('8️ Exibir a tabuada de um número');
    print('9️ Sair do programa');
    print('==========================');
    
   
    stdout.write('Digite sua escolha (1-9): ');
    String? entrada = stdin.readLineSync();
    
    
    if (entrada == null || entrada.isEmpty) {
      print('Entrada inválida. Tente novamente.');
      continue;
    }
    
   
    int escolha;
    try {
      escolha = int.parse(entrada);
    } catch (e) {
      print('Por favor, digite um número válido.');
      continue;
    }
    
    
    switch (escolha) {
      case 1:
        exibirSaudacao();
        break;
      case 2:
        calcularAreaRetangulo();
        break;
      case 3:
        verificarParImpar();
        break;
      case 4:
        compararNumeros();
        break;
      case 5:
        converterNotaParaConceito();
        break;
      case 6:
        exibirContagemProgressiva();
        break;
      case 7:
        somarNumerosAteValor();
        break;
      case 8:
        exibirTabuada();
        break;
      case 9:
        print('Programa finalizado. Até logo!');
        executando = false;
        break;
      default:
        print('Opção inválida. Por favor, digite um número entre 1 e 9.');
    }
    
    
    if (executando) {
      stdout.write('\nPressione Enter para continuar...');
      stdin.readLineSync();
    }
  }
}


void exibirSaudacao() {
  print('\n🎉 Olá, Dart!');
}


void calcularAreaRetangulo() {
  stdout.write('\nDigite a largura do retângulo: ');
  double largura = double.parse(stdin.readLineSync() ?? '0');
  
  stdout.write('Digite a altura do retângulo: ');
  double altura = double.parse(stdin.readLineSync() ?? '0');
  
  double area = largura * altura;
  print('A área do retângulo é: $area');
}


void verificarParImpar() {
  stdout.write('\nDigite um número: ');
  int numero = int.parse(stdin.readLineSync() ?? '0');
  
  if (numero % 2 == 0) {
    print('$numero é um número PAR');
  } else {
    print('$numero é um número ÍMPAR');
  }
}


void compararNumeros() {
  stdout.write('\nDigite o primeiro número: ');
  double num1 = double.parse(stdin.readLineSync() ?? '0');
  
  stdout.write('Digite o segundo número: ');
  double num2 = double.parse(stdin.readLineSync() ?? '0');
  
  if (num1 > num2) {
    print('$num1 é maior que $num2');
  } else if (num1 < num2) {
    print('$num1 é menor que $num2');
  } else {
    print('$num1 é igual a $num2');
  }
}


void converterNotaParaConceito() {
  stdout.write('\nDigite a nota (0-10): ');
  double nota = double.parse(stdin.readLineSync() ?? '0');
  
  String conceito;
  
  if (nota >= 9.0) {
    conceito = 'A';
  } else if (nota >= 8.0) {
    conceito = 'B';
  } else if (nota >= 7.0) {
    conceito = 'C';
  } else if (nota >= 6.0) {
    conceito = 'D';
  } else if (nota >= 5.0) {
    conceito = 'E';
  } else {
    conceito = 'F';
  }
  
  print('Nota $nota = Conceito $conceito');
}


void exibirContagemProgressiva() {
  stdout.write('\nDigite até que número deseja contar: ');
  int limite = int.parse(stdin.readLineSync() ?? '10');
  
  print('\nContagem progressiva:');
  for (int i = 1; i <= limite; i++) {
    print('$i');
  }
}


void somarNumerosAteValor() {
  stdout.write('\nDigite até que número deseja somar: ');
  int limite = int.parse(stdin.readLineSync() ?? '10');
  
  int soma = 0;
  for (int i = 1; i <= limite; i++) {
    soma += i;
  }
  
  print('A soma de todos os números de 1 até $limite é: $soma');
}


void exibirTabuada() {
  stdout.write('\nDigite o número para ver sua tabuada: ');
  int numero = int.parse(stdin.readLineSync() ?? '5');
  
  print('\nTabuada do $numero:');
  for (int i = 1; i <= 10; i++) {
    print('$numero x $i = ${numero * i}');
  }
}