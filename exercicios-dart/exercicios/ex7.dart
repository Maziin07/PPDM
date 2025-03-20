/* 

  Programa: Soma de Numeros
  Autor: Matheus Alves
  Versão: 1.0

*/

import 'dart:io';

void somaNumeros () {
  print("Digite um número:");
  int numero = int.parse(stdin.readLineSync()!);

  int soma = 0;
  int contador = 1;

  while (contador <= numero) {
    soma += contador;
    contador++;
  }

  print("A soma de 1 até $numero é: $soma");

}