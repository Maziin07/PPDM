import 'dart:io'; //Biblioteca de entrada e saída de dados

void parImpar () {
  print("Digite um número inteiro:");
  int numero = int.parse(stdin.readLineSync()!);

  if (numero % 2 == 0) {
    print("O nùmero $numero é par. ");
  } else {
    print(" O nùmero $numero é impar. ");
  }
}