import 'dart:io';

import 'exercicios/barrel.dart';

void exibirMenu() {
  print('''
1- exibir "olá, dart"
2- calcular a área de um retangulo
3- verificar se um numero é par ou impar
4- comparar dois numeros
5- converter nota para conceito
6- exibir contagem progressiva
7- somar todos os numeros até um valor específico
8- exibir a tabuada do numero solicitado
9- sair
''');
}

void main() {
  int escolha = 0; 

  do {
    exibirMenu();
    stdout.write("Escolha uma opção: ");

    try {
     
      escolha = int.parse(stdin.readLineSync()!);
    } catch (e) {
      
      print("Entrada inválida! Por favor, digite um número.");
      continue; 
    }

    print(""); 

    switch (escolha) {
      case 1: 
        olaDart(); 
        break;
      case 2: 
        areaRetangulo(); 
        break;
      case 3: 
        parImpar(); 
        break;
      case 4: 
        compararNumeros(); 
        break;
      case 5: 
        notaConceito(); 
        break;
      case 6: 
        contagemProgressiva(); 
        break;
      case 7: 
        somaNumeros(); 
        break;
      case 8: 
        tabuadaAutomatica(); 
        break;
      case 9: 
        print("Saindo do programa.. Até logo!");
        break;
      default: 
        print("Opção inválida! Tente novamente.");
    }

  } while (escolha != 9); 
  
  }